import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:sushirestaurant/screens/reservationpage.dart';

import '../components/mainbutton.dart';
import '../components/mainbuttonlabel.dart';
import '../components/appbackground.dart';

void main() {
  runApp(const Cashier_HomePage());
}

class Cashier_HomePage extends StatefulWidget {
  const Cashier_HomePage({super.key});

  @override
  State<Cashier_HomePage> createState() => _Cashier_HomePageState();
}

class _Cashier_HomePageState extends State<Cashier_HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBackGround(
          childWidget: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              MainButton(
                                onTouch: () {},
                                imagePath: 'images/sushi1.png',
                              ),
                              Expanded(child: MainButtonLabel(label: 'Menu')),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              MainButton(
                                onTouch: () {},
                                imagePath: 'images/wallet.png',
                              ),
                              Expanded(
                                  child: MainButtonLabel(label: 'Payment')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              MainButton(
                                onTouch: () {},
                                imagePath: 'images/history.png',
                              ),
                              Expanded(
                                  child:
                                      MainButtonLabel(label: 'Order History')),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              MainButton(
                                onTouch: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) {
                                  //       return ReservationPage();
                                  //     },
                                  //   ),
                                  // );
                                },
                                imagePath: 'images/reservation.png',
                              ),
                              Expanded(
                                  child: MainButtonLabel(label: 'Reservation')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
