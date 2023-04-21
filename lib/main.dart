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
          title: Text("Today's Sunrise Forecast",
              style: GoogleFonts.workSans(
                  textStyle: TextStyle(
                fontSize: 30.0,
                color: HexColor("fddec5"),
              ))),
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
                    child: Card(
                        elevation: 20.0,
                        //shadowColor: HexColor("ffd837"),
                        shadowColor: Color.fromARGB(255, 233, 88, 4),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(110.0)),
                        child: CircleAvatar(
                            backgroundColor: HexColor("fd9f6f"),
                            radius: 110.0,
                            child: Center(
                                child: Text('6:59 AM',
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
          title: Text("Sunset Forecast",
              style: GoogleFonts.workSans(
                  textStyle: TextStyle(
                fontSize: 30.0,
                color: HexColor("fddec5"),
              ))),
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
                    child: Card(
                        elevation: 20.0,
                        //shadowColor: HexColor("ffd837"),
                        shadowColor: Color.fromARGB(255, 255, 94, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(110.0)),
                        child: SizedBox(
                          width: 220.0,
                          height: 220.0,
                          child: FittedBox(
                            child: FloatingActionButton(
                              onPressed: () {},

                              child: Container(                              
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      HexColor("fd9f6f"),
                                      HexColor("fea729")
                                    ],
                                  ),
                                ),
                                child: Center( 
                                  child: Text('6:59 PM',
                                    style: GoogleFonts.nabla(
                                      textStyle: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("ffffff"),
                                      ),
                                    )),
                                  )
                              ),
                            
                            ),
                          ),
                        )),
                  )
                  ),
            ),
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
          title: Text("Sunset 3",
              style: GoogleFonts.workSans(
                  textStyle: TextStyle(
                fontSize: 30.0,
                color: HexColor("fddec5"),
              ))),
          backgroundColor: HexColor("8a94f9"),
        ),
      body: Stack(
        children: [
          Container(
              constraints: BoxConstraints.expand(),
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
                  )
            ),

              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [ 
                    const SizedBox(height: 30.0),
                    AspectRatio(
                      aspectRatio: 6,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          //color: Colors.white.withOpacity(.4),
                          //borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text("Today's sunset forecast",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 24.0)),
                        ),
                      ),
                    ),



                    AspectRatio(
                      aspectRatio: 1.2,
                      child: Container(
                              child: Center(
                    child: Card(
                        elevation: 20.0,
                        //shadowColor: HexColor("ffd837"),
                        shadowColor: Color.fromARGB(255, 255, 94, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(110.0)),
                        child: SizedBox(
                          width: 220.0,
                          height: 220.0,
                          child: FittedBox(
                            child: FloatingActionButton(
                              onPressed: () {},

                              child: Container(                              
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      HexColor("fd9f6f"),
                                      HexColor("fea729")
                                    ],
                                  ),
                                ),
                                child: Center( 
                                  child: Text('6:59 PM',
                                    style: GoogleFonts.nabla(
                                      textStyle: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("ffffff"),
                                      ),
                                    )),
                                  )
                              ),
                            
                            ),
                          ),
                        )),
                  )
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    AspectRatio(
                      aspectRatio: 10,
                      child: Container(
                        //padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          //color: Colors.white.withOpacity(.4),
                          //borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text('Quality: 78%',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 24.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            
          ),
        ],
      ),
    );
  }
}
