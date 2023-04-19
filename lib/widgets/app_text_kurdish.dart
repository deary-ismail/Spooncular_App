import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTextKurdish extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppTextKurdish({
    Key? key,
    this.size = 35,
    this.color = Colors.black,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Shasenem',
      ),
    );
  }
}
