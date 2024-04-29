import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sushires_project/login/auth.dart';
import 'package:sushires_project/components/appbackground.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sushires_project/components/mainbutton.dart';
import 'package:sushires_project/components/mainbuttonlabel.dart';
import 'package:sushires_project/menu/MenuPage.dart';
import 'package:sushires_project/screens/readyToPickup.dart';

class Waiter_HomePage extends StatelessWidget {
  Waiter_HomePage({super.key});

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
          title: Text(
            "Waiter Page",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
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
          child: AppBackGround(
            childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MainButton(
                          onTouch: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MenuPage();
                                },
                              ),
                            );
                          },
                          imagePath: 'images/sushi1.png',
                        ),
                        MainButtonLabel(label: 'Menu'),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MainButton(
                            onTouch: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ReadyToPickUp();
                              }));
                            },
                            imagePath: 'images/pickUp.png'),
                        MainButtonLabel(label: 'Ready To Pickup '),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
