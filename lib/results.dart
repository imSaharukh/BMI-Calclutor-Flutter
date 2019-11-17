import 'package:bmi_calculator/inputPage.dart';
import 'package:flutter/material.dart';
import 'Card.dart';
import 'bottom_buttom.dart';

class Result extends StatelessWidget {
  final String bmiresult;
  final String bmiText;
  final String bmifeedback;
  Result({this.bmiresult, this.bmiText, this.bmifeedback});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ReCard(
              color: activecardColor,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiText,
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    bmiresult,
                    style:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmifeedback,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
            ),
            flex: 5,
          ),
          Bottom(
            title: 'Re-Calculate',
            onTapped: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
