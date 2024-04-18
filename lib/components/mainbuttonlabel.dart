import 'package:flutter/material.dart';
import 'package:sushires_project/constants.dart';

class MainButtonLabel extends StatelessWidget {
  MainButtonLabel({@required this.label});
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        label!,
        style: menuLabelStyle,
      ),
    );
  }
}
