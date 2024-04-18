import 'package:flutter/material.dart';

class SushiBarLogo extends StatelessWidget {
  const SushiBarLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: Color(0xFFf3d1c8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
        child: Text(
          'Heroi Sushi Bar',
          style: TextStyle(
            color: Color(0xFFF8774A),
            fontFamily: 'Nunito',
            letterSpacing: 1.5,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
