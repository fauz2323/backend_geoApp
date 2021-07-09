import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abut App"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'LoremIpsum'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    applicationIcon: FlutterLogo(),
                    applicationLegalese: "Information Apps",
                    applicationName: "GeoApp - Wisata kab. Bogor",
                    applicationVersion: '0.0.1(Beta)',
                  );
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "About App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
