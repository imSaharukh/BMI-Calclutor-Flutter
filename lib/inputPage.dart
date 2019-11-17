import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results.dart';
import 'const.dart';
import 'Card.dart';
import 'CardEle.dart';
import 'bottom_buttom.dart';
import 'calculate.dart';

const activecardColor = Color(0xFF2A2B3B);
final inactiveCardColor = Color(0xFF222234);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 20;
  var maleCardColor = inactiveCardColor;
  var femaleCardColor = inactiveCardColor;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                        print('male');
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activecardColor
                        : inactiveCardColor,
                    widget: CardEle(
                      text: 'MALE',
                      fontAwesomeIcons: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                        print('male');
                      });
                    },
                    widget: CardEle(
                      text: 'FEMALE',
                      fontAwesomeIcons: FontAwesomeIcons.venus,
                    ),
                    color: selectedGender == Gender.female
                        ? activecardColor
                        : inactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReCard(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'height',
                    style: KtextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(height.toString(), style: KnumberStyle),
                      Text(
                        'cm',
                        style: KtextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: Color(0xFFEA1556),
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
              color: activecardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReCard(
                    color: activecardColor,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Weight', style: KtextStyle),
                        Text(
                          weight.toString(),
                          style: KnumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReCard(
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: KtextStyle),
                        Text(
                          age.toString(),
                          style: KnumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                    color: activecardColor,
                  ),
                ),
              ],
            ),
          ),
          Bottom(
            title: 'Calculate',
            onTapped: () {
              Calculator cal = Calculator(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmiresult: cal.bmiresulr(),
                    bmiText: cal.resultText(),
                    bmifeedback: cal.bmifeetback(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.whatTodo);
  final IconData icon;
  final Function whatTodo;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: whatTodo,
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
