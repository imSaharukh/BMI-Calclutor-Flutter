import 'package:flutter/material.dart';
import 'const.dart';

class CardEle extends StatelessWidget {
  CardEle({@required this.fontAwesomeIcons, @required this.text});
  final IconData fontAwesomeIcons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          fontAwesomeIcons,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(text, style: KtextStyle)
      ],
    );
  }
}
