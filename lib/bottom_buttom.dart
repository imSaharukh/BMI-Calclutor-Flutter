import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  final Function onTapped;
  final String title;
  Bottom({this.onTapped, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        color: Color(0xFFEA1556),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
