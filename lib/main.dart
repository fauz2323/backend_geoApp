import 'package:dashboard_flutter_01/about.dart';
import 'package:dashboard_flutter_01/griddashboard.dart';
import 'package:dashboard_flutter_01/info.dart';
import 'package:dashboard_flutter_01/maps.dart';
import 'package:dashboard_flutter_01/second.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      routes: {
        '/wisata': (BuildContext context) => Second(),
        '/about': (BuildContext context) => About(),
        '/location': (BuildContext context) => Maps(),
        '/info': (BuildContext context) => Info(),
      },
    ));

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dashboard~GeoApp",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          GridDashboard(),
        ],
      ),
    );
  }
}
