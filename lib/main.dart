import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunset Time App',
      home: MyWidget(),
      
    );
  }
}

//DO NOT DELETE ABOVE----------------------------------------------------------------------------------------//
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sunset Sunrise Times",
            style: GoogleFonts.workSans(
                textStyle: TextStyle(
              fontSize: 25.0,
              color: HexColor("ffffff"), //fddec5
            ))),
        backgroundColor: HexColor("8a94f9"),
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
                        HexColor("8a94f9"),
                        HexColor("eaae99"),
                        HexColor("febb5b"),
                      ],
                    )),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 50.0),
                          AspectRatio(
                            aspectRatio: 4,
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  //color: Colors.white.withOpacity(.4),
                                  //borderRadius: BorderRadius.circular(15),
                                  ),
                              child: Center(
                                child: Text("Today's sunset forecast:",
                                    style: GoogleFonts.workSans(
                                        textStyle: TextStyle(
                                      fontSize: 24.0,
                                      color: HexColor("ffffff"), //fddec5
                                    ))),
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1.3,
                            child: FutureBuilder<Map<String, dynamic>>(
                              future: getData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  String sunset =
                                      snapshot.data!['results']['sunset'];
                                  String firstFourChars =
                                      sunset.substring(0, 4);
                                  String sunsetWithPM = '$firstFourChars PM';

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
                                                      style: GoogleFonts.nabla(
                                                        textStyle: TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: HexColor(
                                                              "ffffff"),
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
                          ), //futurebuilder
                          const SizedBox(height: 20.0),
                          AspectRatio(
                            aspectRatio: 10,
                            child: Container(
                              //padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(),
                              child: Center(
                                child: Text('Quality: 78%',
                                     style: GoogleFonts.workSans(
                                        textStyle: TextStyle(
                                      fontSize: 24.0,
                                      color: HexColor("ffffff"), //fddec5
                                    ))),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          AspectRatio(
                            aspectRatio: 10,
                            child: Container(
                              //padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(),
                              child: Center(
                                child: Text('Great Quality!',
                                  style: GoogleFonts.workSans(
                                        textStyle: TextStyle(
                                      fontSize: 24.0,
                                      color: HexColor("ffffff"), //fddec5
                                    ))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  onTap: () {
                    Navigator.pushNamed(context, 'second');
                  })),
        ],
      ),
    );
  }
}
