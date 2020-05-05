import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main.dart';
import '../model/card.dart';
import '../model/labeled_icon.dart';
import '../model/plus_minus.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _gender;
  double _height = 1.65;
  int weight = 65;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculadora IMC"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // GENDER SELECT
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomCard(
                            onPress: () =>
                                setState(() => _gender = Gender.male),
                            color: _gender == Gender.male
                                ? activeColor
                                : cardColor,
                            child: IconLabel(
                              icon: FontAwesomeIcons.mars,
                              label: 'MASCULINO',
                              labelTextStyle: labelStyle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomCard(
                            onPress: () =>
                                setState(() => _gender = Gender.female),
                            color: _gender == Gender.female
                                ? activeColor
                                : cardColor,
                            child: IconLabel(
                              icon: FontAwesomeIcons.venus,
                              label: 'FEMININO',
                              labelTextStyle: labelStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // HEIGHT SELECT
                  Expanded(
                    child: CustomCard(
                        color: cardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('ALTURA', style: labelStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  _height.toStringAsFixed(2),
                                  style: numberStyle,
                                ),
                                Text('m'),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                                thumbColor: accentColor,
                                overlayColor: activeColor.withAlpha(70),
                                activeTrackColor: accentColor.withAlpha(90),
                                inactiveTrackColor: Colors.grey,
                              ),
                              child: Slider(
                                value: _height,
                                min: 1.0,
                                max: 3.0,
                                onChanged: (double _newHeight) {
                                    setState(() => _height = _newHeight);
                                },
                              ),
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        // WEIGHT SELECT
                        Expanded(
                          child: CustomCard(
                              color: cardColor,
                              child: PlusMinusButtons(
                                label: 'PESO',
                                number: weight,
                                numberStyle: numberStyle,
                                labelTextStyle: labelStyle,
                                accentColor: accentColor,
                                pressedButtonColor: activeColor,
                                minusButton: () => setState(() => weight--),
                                plusButton: () => setState(() => weight++),
                              )),
                        ),
                        Expanded(
                          child: CustomCard(
                            color: cardColor,
                            child: PlusMinusButtons(
                              label: 'IDADE',
                              number: age,
                              numberStyle: numberStyle,
                              labelTextStyle: labelStyle,
                              accentColor: accentColor,
                              pressedButtonColor: activeColor,
                              minusButton: () => setState(() => age--),
                              plusButton: () => setState(() => age++),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: bottomButtomColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
