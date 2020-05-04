import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculadora_imc/model/card.dart';
import 'package:calculadora_imc/model/labeled_icon.dart';

const _cardColor = Color(0xFF1D1E33);
const _activeCardColor = Colors.green;
const _cardTextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
);
enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _gender;
  int height = 180;

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
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomCard(
                            onPress: () => setState(() => _gender = Gender.male),
                            color: _gender == Gender.male ? _activeCardColor : _cardColor,
                            child: IconLabel(
                                icon: FontAwesomeIcons.mars,
                                label: 'MASCULINO'),
                          ),
                        ),
                        Expanded(
                          child: CustomCard(
                            onPress:  () => setState(() => _gender = Gender.female),
                            color: _gender == Gender.female ? _activeCardColor : _cardColor,
                            child: IconLabel(
                                icon: FontAwesomeIcons.venus,
                                label: 'FEMININO'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: _cardColor,
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text('ALTURA', style: TextStyle(fontSize: 14)),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.baseline,
                           textBaseline: TextBaseline.alphabetic,
                           children: <Widget>[
                             Text(
                               height.toString(),
                               style: _cardTextStyle,
                             ),
                             Text('cm '),
                           ],
                         )
                       ], 
                      ) 
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomCard(color: _cardColor),
                        ),
                        Expanded(
                          child: CustomCard(color: _cardColor),
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
                  color: Colors.pink,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
            ),
          )
        ],
      ),
    );
  }
}
