import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sushires_project/login/auth.dart';
import 'package:sushires_project/components/appbackground.dart';
import 'package:sushires_project/login/cashier_widget_tree.dart';
import 'package:sushires_project/components/mainbutton.dart';
import 'package:sushires_project/components/mainbuttonlabel.dart';

class Cashier_HomePage extends StatefulWidget {
  Cashier_HomePage({super.key});

  final User? user = Auth().currentUser;

  @override
  State<Cashier_HomePage> createState() => _Cashier_HomePageState();
}

class _Cashier_HomePageState extends State<Cashier_HomePage> {
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
          title: Center(
            child: Text(
              "Cashier Page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('${user?.email}'),
                onTap: () {},
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
        body: AppBackGround(
          childWidget: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        MainButton(
                            onTouch: () {}, imagePath: 'images/sushi1.png'),
                        MainButtonLabel(label: 'Menu')
                      ],
                    ),
                    Column(
                      children: [
                        MainButton(
                            onTouch: () {}, imagePath: 'images/wallet.png'),
                        MainButtonLabel(label: 'Payment')
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        MainButton(
                            onTouch: () {}, imagePath: 'images/history.png'),
                        MainButtonLabel(label: 'History')
                      ],
                    ),
                    Column(
                      children: [
                        MainButton(
                            onTouch: () {},
                            imagePath: 'images/reservation.png'),
                        MainButtonLabel(label: 'Reservation'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
