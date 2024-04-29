import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sushires_project/components/appbackground.dart';
import 'package:sushires_project/menu/databaseMenu2.dart';

class ReadyToPickUp extends StatefulWidget {
  const ReadyToPickUp({super.key});

  @override
  State<ReadyToPickUp> createState() => _ReadyToPickUpState();
}

class _ReadyToPickUpState extends State<ReadyToPickUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
          title: Text(
            'READY TO PICK UP!!!',
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
              margin: EdgeInsets.only(left: 8, right: 8, top: 10),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('ReadyToPickUp')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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

                  List<String> orderNumbers = snapshot.data!.docs
                      .map((doc) => doc['orderNumber'] as String)
                      .toList();
                  return OrderList(orderNumbers: orderNumbers);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  final List<String> orderNumbers;

  const OrderList({Key? key, required this.orderNumbers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderNumbers.length,
      itemBuilder: (context, index) {
        String orderNumber = orderNumbers[index];
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                      child: Icon(
                        Icons.check_circle_outline,
                        size: 20,
                        color: Colors.green,
                      ),
                      onTap: () {
                        FirestoreService.deleteOrder(orderNumber);
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
  }
}
