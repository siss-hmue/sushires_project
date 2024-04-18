import 'package:flutter/material.dart';
import 'package:sushires_project/constants.dart';

class AppBackGround extends StatelessWidget {
  AppBackGround({@required this.childWidget});
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundStyle,
      child: childWidget,
    );
  }
}
