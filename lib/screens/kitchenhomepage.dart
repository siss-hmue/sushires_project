import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushires_project/menu/databaseMenu2.dart';

import '../login/auth.dart';

class KitchenPage extends StatefulWidget {
  @override
  _KitchenPageState createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {
  final User? user = Auth().currentUser;

  Future<void> signOut(BuildContext context) async {
    await Auth().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
          title: Text(
            'Incoming Orders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        endDrawer: Drawer(
          // Define the right-side drawer content
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30), // Adjust bottom padding
            children: <Widget>[
              // Add your drawer menu items here
              ListTile(
                leading: Icon(Icons.person),
                title: Text('${user?.email}'),
                onTap: () {
                  // Navigate to the home screen// Close the drawer
                },
              ),
              SizedBox(
                height: 650,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    signOut(context);
                  },
                  child: Text('Sign out'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 40),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(10),
            child: OrdersList(),
          ),
        ),
      ),
    );
  }
}

class OrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('tempOrder').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return Container(
            child: Center(
              child: Text('No orders'),
            ),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];
            // Retrieve the orderNumber field from the document data
            String orderNumber = ds['orderNumber'];
            List<Map<String, dynamic>> items =
                List<Map<String, dynamic>>.from(ds['items']);
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         ReadyToPickUpPage(orderNumber: orderNumber),
                    //   ),
                    // );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order ID: $orderNumber',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Order Details'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: items.map((item) {
                                        return ListTile(
                                          title: Text(item['itemName']),
                                          subtitle: Text(
                                              'Quantity: ${item['quantity']}'),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            size: 20,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_alert,
                            color: Colors.green,
                            size: 20,
                          ),
                          onPressed: () async {
                            // Save the orderNumber to the ReadyToPickUp collection
                            await FirestoreService.addToReadyToPickup(
                                orderNumber);

                            // Delete the orderNumber from the tempOrder collection
                            FirestoreService.deleteFromTempOrder(orderNumber);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
