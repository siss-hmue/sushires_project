import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushires_project/components/appbackground.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
          title: Row(
            children: [
              GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 115,
              ),
              Text(
                'Payment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
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
            String orderNumber = ds['orderNumber'];
            double totalAmount = ds['totalAmount'] ?? 0.0;
            return OrderListItem(
                orderNumber: orderNumber, totalAmount: totalAmount);
          },
        );
      },
    );
  }
}

class OrderListItem extends StatelessWidget {
  final String orderNumber;
  final double totalAmount;

  const OrderListItem(
      {Key? key, required this.orderNumber, required this.totalAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
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
              Text(
                '\$${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.payments,
                size: 20,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
