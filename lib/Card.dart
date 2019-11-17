import 'package:flutter/material.dart';

class ReCard extends StatelessWidget {
  ReCard({@required this.color, this.widget, this.onPressed});
  final Color color;
  final Widget widget;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: widget,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
      ),
    );
  }
}
