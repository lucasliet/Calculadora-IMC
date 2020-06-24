import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme.dart';
import '../components/custom_card.dart';
import '../components/slider.dart';
import '../components/gender_icon.dart';
import '../components/plus_minus_buttons.dart';
import '../components/bottom_button.dart';
import 'results_drawer.dart';

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
  int _weight = 65;
  int _age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ResultsDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculadora IMC", style: titleStyle,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //
                  // GENDER SELECT
                  //
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                  // HEIGHT SELECT
                  //
                  Expanded(
                    child: CustomCard(
                      child: CustomSlider(
                        label: 'ALTURA',
                        height: _height,
                        child: Slider(
                          value: _height,
                          min: 1.0,
                          max: 3.0,
                          onChanged: (double _newHeight) =>
                              setState(() => _height = _newHeight),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        //
                        // WEIGHT SELECT
                        //
                        Expanded(
                          child: CustomCard(
                            child: PlusMinusButtons(
                              label: 'PESO',
                              number: _weight,
                              minusButton: () => setState(() => _weight--),
                              plusButton: () => setState(() => _weight++),
                            ),
                          ),
                        ),
                        //
                        // AGE SELECT
                        //
                        Expanded(
                          child: CustomCard(
                            child: PlusMinusButtons(
                              label: 'IDADE',
                              number: _age,
                              minusButton: () => setState(() => _age--),
                              plusButton: () => setState(() => _age++),
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
          //
          // CALC BUTTON
          //
          Expanded(
            child: BottomButton(
              label: 'CALCULAR',
              route: '/result',
              args: {'height':_height,'weight':_weight},
            ),
          ),
        ],
      ),
    );
  }
}
