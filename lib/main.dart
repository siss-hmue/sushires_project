import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/appbackground.dart';
import 'screens/firstloginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBackGround(
          childWidget: FirstLogInPage(),
        ),
      ),
    );
  }
}
