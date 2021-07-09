import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/wisataModel.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  List<Wisata> _data2 = [];

  Future<Null> _wisataFetch() async {
    http.Response response =
        await http.get("http://verdantha.online/api/webApiAll");
    print(_data2);
    if (response.statusCode != 500) {
      final data = jsonDecode(response.body);
      List _data1 = data["wisata"];
      for (Map i in _data1) {
        _data2.add(Wisata.fromJson(i));
      }
      // print(_wisata);
      print(_data1);
    }
    print("not konek");
    print(response.statusCode);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _wisataFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Wisata"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _data2.length,
          itemBuilder: (context, index) {
            final x = _data2[index];
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(x.nama),
                  Text(x.alamat),
                  Text(x.latitude),
                  // Text(x.deskripsi),
                  Text("hehehe"),
                ],
              ),
            );
          },
        ),

        // child: Column(
        //   children: <Widget>[Text("data")],
        // ),
      ),
    );
  }
}
