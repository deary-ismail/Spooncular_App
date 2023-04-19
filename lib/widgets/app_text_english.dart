import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTextEnglish extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppTextEnglish({
    Key? key,
    this.size = 35,
    this.color = Colors.black,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle style = theme.textTheme.bodyText1!.copyWith(
      color: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
      fontFamily: 'Roboto-Regular',
      fontSize: size,
    );
    return Text(
      text,
      style: style,
    );
  }
}
