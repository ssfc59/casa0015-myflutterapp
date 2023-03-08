import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Today's Sunset Forecast",
                   style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: HexColor("#6675FF"),
              ),),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
               stops: [
                0.1,
                0.5,
                0.99,
                ],
            colors: [
              HexColor("#6675FF"),
              HexColor("#E7936F"),
              HexColor("#FEAD34"),
            ],
          )),
          child:
          Center(

              child: CircleAvatar(
            backgroundColor: HexColor("FF710B"),
            radius: 110,
          )
          ), //child center, circle avatar
        ), //child container
      ), //body center
    ));
  }
}

