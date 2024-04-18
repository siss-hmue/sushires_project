import 'package:flutter/material.dart';
import 'package:sushires_project/constants.dart';

class MainButton extends StatelessWidget {
  MainButton({@required this.onTouch, @required this.imagePath});
  final Function()? onTouch;
  final String? imagePath;
  // final int width = 180;
  // final int height = 180;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onTouch,
        child: Image(
          image: AssetImage(imagePath!),
        ),
      ),
      width: 150,
      height: 150,
      //color: Colors.grey,
      decoration: mainButtonStyle,
    );
  }
}
