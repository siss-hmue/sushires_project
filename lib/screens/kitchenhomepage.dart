import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushires_project/components/appbackground.dart';

class KitchenPage extends StatefulWidget {
  const KitchenPage({Key? key}) : super(key: key);

  @override
  _KitchenPageState createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Incoming Orders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: AppBackGround(
            childWidget: Container(
              margin: EdgeInsets.all(10),
              child: OrdersList(),
            ),
          ),
        ),
      ),
    );
  }
}

class OrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('orders').snapshots(),
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
                    // Add your onTap logic here
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
                          //'Order ID: ${ds.id}',
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
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: items.map((item) {
                                      return ListTile(
                                        title: Text(item['itemName']),
                                        subtitle: Text(
                                            'Quantity: ${item['quantity']}'),
                                      );
                                    }).toList(),
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
                        Icon(
                          Icons.add_alert,
                          size: 20,
                          color: Colors.green,
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
