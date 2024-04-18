import 'auth.dart';
import 'package:sushires_project/screens/waiterhomepage.dart';
import 'package:sushires_project/login/waiter_login.dart';
import 'package:flutter/material.dart';

class Waiter_WidgetTree extends StatefulWidget {
  const Waiter_WidgetTree({super.key});

  @override
  State<Waiter_WidgetTree> createState() => _Waiter_WidgetTreeState();
}

class _Waiter_WidgetTreeState extends State<Waiter_WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStageChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Waiter_HomePage();
          } else {
            return Waiter_Login();
          }
        });
  }
}
