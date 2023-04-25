import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunscope App',
      initialRoute: 'MyWidget',
      routes: {
        'MyWidget': (context) => MyWidget(),
        'sunset': (context) => SecondRoute(),
      },
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Future<Map<String, dynamic>> getData() async {
    final response = await http.get(Uri.parse(
        'https://api.sunrisesunset.io/json?lat=51.52552&lng=0.03522'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sunset & Sunrise Times",
            style: GoogleFonts.workSans(
                textStyle: TextStyle(
              fontSize: 25.0,
              color: HexColor("fddec5"),
            ))),
        backgroundColor: HexColor("8a94f9"),
      ),
      body: Stack(
        children: [
          GestureDetector(
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
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30.0),
                      AspectRatio(
                        aspectRatio: 4,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(),
                          child: Center(
                            child: Text("Today's sunset forecast:",
                                style: GoogleFonts.workSans(
                                    textStyle: TextStyle(
                                  fontSize: 26.0,
                                  color: HexColor("8167ff"),
                                ))),
                          ),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1.5,
                        child: FutureBuilder<Map<String, dynamic>>(
                          future: getData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              String? sunset =
                                  snapshot.data?['results']['sunset'];
                              String? firstFourChars = sunset?.substring(0, 4);
                              String? sunsetWithPM = '$firstFourChars PM';
                              return Center(
                                  child: SizedBox(
                                      width: 220.0,
                                      height: 220.0,
                                      child: FittedBox(
                                        child: FloatingActionButton(
                                          onPressed: () {
                                            print(sunsetWithPM);
                                          },
                                          child: Container(
                                              width: 220.0,
                                              height: 220.0,
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
                                                child: Text(
                                                  sunsetWithPM,
                                                  style: GoogleFonts.dosis(
                                                    textStyle: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      )));
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      AspectRatio(
                        aspectRatio: 10,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Center(
                            child: Text('Quality: 78%',
                                style: GoogleFonts.workSans(
                                    textStyle: TextStyle(
                                  fontSize: 26.0,
                                  color: HexColor("ffffff"),
                                ))),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      AspectRatio(
                        aspectRatio: 10,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Center(
                            child: Text('Great Quality!',
                                style: GoogleFonts.workSans(
                                    textStyle: TextStyle(
                                  fontSize: 26.0,
                                  color: HexColor("ffffff"),
                                ))),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      AspectRatio(
                        aspectRatio: 10,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Center(
                            child: Text('powered by sunrisesunset.io',
                                style: GoogleFonts.workSans(
                                    textStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: HexColor("ffffff"),
                                ))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              onTap: () {
                Navigator.pushNamed(context, 'sunset');
              }),
        ],
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  @override
  _MySecondRouteState createState() => _MySecondRouteState();
}

class _MySecondRouteState extends State<SecondRoute> {
  Future<Map<String, dynamic>> getData() async {
    final response = await http.get(Uri.parse(
        'https://api.sunrisesunset.io/json?lat=51.52552&lng=0.03522'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sunset & Sunrise Times",
            style: GoogleFonts.workSans(
                textStyle: TextStyle(
              fontSize: 26.0,
              color: HexColor("fefaea"),
            ))),
        backgroundColor: HexColor("fdbb5b"),
      ),
      body: Stack(
        children: [
          Container(
              child: GestureDetector(
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
                        HexColor("fdbb5b"),
                        HexColor("f0af8e"),
                        HexColor("97a8ec"),
                      ],
                    )),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 30.0),
                          AspectRatio(
                            aspectRatio: 4,
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(),
                              child: Center(
                                child: Text("Today's sunrise forecast:",
                                    style: GoogleFonts.workSans(
                                        textStyle: TextStyle(
                                      fontSize: 26.0,
                                      color: HexColor("e67747"), //fddec5
                                    ))),
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1.5,
                            child: FutureBuilder<Map<String, dynamic>>(
                              future: getData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData && snapshot.data != null) {
                                  String? sunrise =
                                      snapshot.data?['results']['sunrise'];
                                  String? ffirstFourChars =
                                      sunrise?.substring(0, 4);
                                  String? sunriseWithAM = '$ffirstFourChars AM';

                                  return Center(
                                      child: SizedBox(
                                          width: 220.0,
                                          height: 220.0,
                                          child: FittedBox(
                                            child: FloatingActionButton(
                                              onPressed: () {
                                                print(sunriseWithAM);
                                              },
                                              child: Container(
                                                  width: 220.0,
                                                  height: 220.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomLeft,
                                                      colors: [
                                                        HexColor("ffc992"),
                                                        HexColor("ffd285")
                                                      ],
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      sunriseWithAM,
                                                      style: GoogleFonts.dosis(
                                                        textStyle: TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white
                                                              .withOpacity(0.8),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          )));
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          AspectRatio(
                            aspectRatio: 10,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Center(
                                child: Text('Quality: 80%',
                                    style: GoogleFonts.workSans(
                                        textStyle: TextStyle(
                                      fontSize: 26.0,
                                      color: HexColor("ffffff"),
                                    ))),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          AspectRatio(
                            aspectRatio: 10,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Center(
                                child: Text('Great Quality!',
                                    style: GoogleFonts.workSans(
                                        textStyle: TextStyle(
                                      fontSize: 26.0,
                                      color: HexColor("ffffff"),
                                    ))),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          AspectRatio(
                            aspectRatio: 10,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Center(
                                child: Text('powered by sunrisesunset.io',
                                    style: GoogleFonts.workSans(
                                        textStyle: TextStyle(
                                      fontSize: 12.0,
                                      color: HexColor("ffffff"),
                                    ))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  onTap: () {
                    Navigator.pushNamed(context, 'MyWidget');
                  })),
        ],
      ),
    );
  }
}
