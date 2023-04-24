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
        title: Text("Today's Sunset Forecast"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String sunset = snapshot.data!['results']['sunset'];
            String firstFourChars = sunset.substring(0, 4);
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
                              colors: [HexColor("fd9f6f"), HexColor("fea729")],
                            ),
                          ),
child: Center(
                          child: Text(
                            sunsetWithPM,
                            style: GoogleFonts.nabla(
                              textStyle: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: HexColor("ffffff"),
                              ),
                            ),
                          ),
)
                        ),
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
    );
  }
}
