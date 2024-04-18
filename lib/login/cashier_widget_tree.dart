import 'auth.dart';
import 'package:sushires_project/screens/cashierhomepage.dart';
import 'package:sushires_project/login/cashier_login.dart';
import 'package:flutter/material.dart';

class Cashier_WidgetTree extends StatefulWidget {
  const Cashier_WidgetTree({super.key});

  @override
  State<Cashier_WidgetTree> createState() => _Cashier_WidgetTreeState();
}

class _Cashier_WidgetTreeState extends State<Cashier_WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStageChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Cashier_HomePage();
          } else {
            return Cashier_Login();
          }
        });
  }
}
