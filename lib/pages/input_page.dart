import 'package:flutter/material.dart';

const _cardColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(color: _cardColor),
                        ),
                        Expanded(
                          child: Card(color: _cardColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Card(color: _cardColor),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(color: _cardColor),
                        ),
                        Expanded(
                          child: Card(color: _cardColor),
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
              color: Colors.pinkAccent,
            ),
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final Color color;

  Card({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
