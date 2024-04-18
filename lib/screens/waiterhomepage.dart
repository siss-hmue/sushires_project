import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sushires_project/login/auth.dart';
import 'package:sushires_project/components/appbackground.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sushires_project/components/mainbutton.dart';
import 'package:sushires_project/components/mainbuttonlabel.dart';

class Waiter_HomePage extends StatelessWidget {
  Waiter_HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget title() {
    return const Text('Firebase Auth');
  }

  Widget signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Waiter Page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
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
                  onPressed: signOut,
                  child: Text('Sign out'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 40),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: AppBackGround(
          childWidget: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      MainButton(
                        onTouch: () {},
                        imagePath: 'images/sushi1.png',
                      ),
                      MainButtonLabel(
                        label: 'Menu',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      MainButton(
                          onTouch: () {
                            Alert(
                              context: context,
                              type: AlertType.info,
                              desc: "Payment section is locked",
                            ).show();
                          },
                          imagePath: 'images/payment_waiter.png'),
                      MainButtonLabel(label: 'Payment'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      MainButton(
                          onTouch: () {
                            Alert(
                              context: context,
                              type: AlertType.info,
                              desc: "Order History section is locked",
                            ).show();
                          },
                          imagePath: 'images/order_waiter.png'),
                      MainButtonLabel(label: 'Order History'),
                    ],
                  ),
                  Column(
                    children: [
                      MainButton(
                          onTouch: () {
                            Alert(
                              context: context,
                              type: AlertType.info,
                              desc: "Reservation section is locked",
                            ).show();
                          },
                          imagePath: 'images/delivery_waiter.png'),
                      MainButtonLabel(label: 'Reservation'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
