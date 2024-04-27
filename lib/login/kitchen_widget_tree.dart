import 'package:flutter/material.dart';
import 'package:sushires_project/login/kitchen_login.dart';
import 'package:sushires_project/screens/kitchenhomepage.dart';

import 'auth.dart';

class Kitchen_WidgetTree extends StatefulWidget {
  const Kitchen_WidgetTree({super.key});

  @override
  State<Kitchen_WidgetTree> createState() => _Kitchen_WidgetTreeState();
}

class _Kitchen_WidgetTreeState extends State<Kitchen_WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStageChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return KitchenPage();
          } else {
            return Kitchen_Login();
          }
        });
  }
}
