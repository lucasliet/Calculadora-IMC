import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculadora_imc/widgets/card.dart';
import 'package:calculadora_imc/widgets/labeled_icon.dart';

const _cardColor = Color(0xFF1D1E33);
const _activeCardColor = Color(0xFF111328);
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
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomCard(
                            onPress: () => setState(() => _gender = Gender.male),
                            color: _gender == Gender.male ? _activeCardColor : _cardColor,
                            content: IconLabel(
                                icon: FontAwesomeIcons.mars,
                                label: 'MASCULINO'),
                          ),
                        ),
                        Expanded(
                          child: CustomCard(
                            onPress: () => setState(() => _gender = Gender.female),
                            color: _gender == Gender.female ? _activeCardColor : _cardColor,
                            content: IconLabel(
                                icon: FontAwesomeIcons.venus,
                                label: 'FEMININO'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CustomCard(color: _cardColor),
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
                  color: Colors.pink[500],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
            ),
          )
        ],
      ),
    );
  }
}
