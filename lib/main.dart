import 'package:flutter/material.dart';
import './widgets/home.dart';

void main() => runApp(Eplanner());

class Eplanner extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
        title: 'E-Planner',
        home: Home(),
        theme: ThemeData(
          primarySwatch: Colors.purple,
          //fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'Roboto',
              fontSize: 20,
            ),
            color: Colors.indigo
          ),

        ),

    );
  }
}