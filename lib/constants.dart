import 'package:flutter/material.dart';

const backgroundStyle = BoxDecoration(
  image: DecorationImage(
      image: AssetImage('images/background.png'), fit: BoxFit.cover),
);

const mainButtonStyle = BoxDecoration(
  color: Color(0xFFE0E0E0),
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

const menuLabelStyle = TextStyle(
  fontFamily: 'Jost',
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
