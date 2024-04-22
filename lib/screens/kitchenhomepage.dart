import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sushires_project/components/appbackground.dart';

class Kitchen_HomePage extends StatefulWidget {
  const Kitchen_HomePage({super.key});

  @override
  State<Kitchen_HomePage> createState() => _Kitchen_HomePageState();
}

class _Kitchen_HomePageState extends State<Kitchen_HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Incoming Orders",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
        ),
        body: AppBackGround(
          childWidget: Container(
            //will add expanded later
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              children: [
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'OrderIdidk1234',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.add_alert,
                            size: 20,
                            color: Colors.green,
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
