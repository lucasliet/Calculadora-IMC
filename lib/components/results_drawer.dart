import 'package:flutter/material.dart';
import '../components/card.dart';
import '../theme.dart';

class ResultsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: cardColor,
              child: DrawerHeader(
                child: Text('Seus resultados', style: titleStyle),
              ),
            ),
            CustomCard(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Data'),
                        Text('06/04/2020', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Resultado'),
                        Text('18', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            CustomCard(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Data'),
                        Text('06/04/2020', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Resultado'),
                        Text('18', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
