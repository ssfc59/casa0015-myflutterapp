import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunset Time App',
      home: const FirstRoute(),
      routes: {
        "second": (context) {
          return const SecondRoute();
        },
        "third": (context) {
          return const ThirdRoute();
        }
      },
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Today's Sunset Forecast",
              style: GoogleFonts.workSans( 
                 textStyle: TextStyle(
                fontSize: 30.0,
                color: HexColor("fddec5"),
              )
              ) 
              ),
          backgroundColor: HexColor("8a94f9"),
        ),
        body: GestureDetector(
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    stops: const [
                      0.1,
                      0.5,
                      0.99,
                    ],
                    colors: [
                      HexColor("8a94f9"),
                      HexColor("eaae99"),
                      HexColor("febb5b"),
                    ],
                  )),
                  child: Center(
                    child: Container(
                        child: CircleAvatar(
                            backgroundColor: HexColor("fd9f6f"),
                            radius: 110,
                            child: Center(
                                child: Text('6:59 PM',
                                    style: GoogleFonts.nabla(
                                      textStyle: TextStyle(
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("ffffff"),
                                      ),
                                    ))))),
                  )),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'second');
            }));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Route"),
        ),
        body: GestureDetector(
            child: const Center(child: Text('Second Route')),
            onTap: () {
              Navigator.pushNamed(context, 'third');
            }));
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Route"),
      ),
    );
  }
}
