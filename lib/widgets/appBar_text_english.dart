import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarTextEnglish extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppBarTextEnglish({
    Key? key,
    this.size = 35,
    this.color = Colors.black,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Roboto-Regular',
        fontSize: size,
        color: color,
      ),
    );
  }
}
