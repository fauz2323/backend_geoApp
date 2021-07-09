import 'package:dashboard_flutter_01/page/wisataPage.dart';
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
  var load = true;
  Future<Null> _wisataFetch() async {
    final response = await http.get("http://verdantha.online/api/webApiCat");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        for (Map i in data) {
          _data2.add(Wisata.fromJson(i));
        }
        load = false;
      });
    }

    print(_data2);
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
        child: load
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _data2.length,
                itemBuilder: (context, index) {
                  final x = _data2[index];
                  return Container(
                    margin: EdgeInsets.only(top: 8, left: 4, right: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(9),
                          margin: EdgeInsets.all(0),
                          child: Center(
                            child: Text(x.nama),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(x.deskripsi),
                                Text(x.categories.categories),
                                Text(x.photos[0].photos)
                              ],
                            ),
                          ],
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WisataPage(wisata : x)),
                                );
                              },
                              child: Text("Baca Selengkapnya")),
                        ),
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
