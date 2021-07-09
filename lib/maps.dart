import 'package:dashboard_flutter_01/model/mapsModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Maps extends StatefulWidget {
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Iterable markers = [];
  // List<User> _list = [];
  // Set<Marker> _mark = {};

  Future<Null> _fetchData() async {
    http.Response response =
        await http.get("https://verdantha.online/api/webApiAll");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // for (Map i in data) {
      //   _list.add(User.fromJson(i));
      // }

      // List results = data['address'];

      List results = data;
      final count = results.length;
      Iterable _markers = Iterable.generate(count, (i) {
        final index = results[i];
        // Map locations = index['geo'];

        LatLng latlngMarkers = LatLng(
            double.parse(index["latitude"]), double.parse(index["longitude"]));
        print(latlngMarkers);
        return Marker(
          markerId: MarkerId("$index"),
          position: latlngMarkers,
          onTap: () {},
        );
      });
      setState(() {
        markers = _markers;
      });
    }
  }

  GoogleMapController mapController;

  final LatLng _center = const LatLng(50.474127890958215, 30.513837653303227);

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Wisata'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: <Widget>[
          // Container(
          //   child: ListView.builder(
          //     itemCount: _list.length,
          //     itemBuilder: (context, i) {
          //       final x = _list[i];
          //       final latLng = [x.address.geo.lat, x.address.geo.lng];
          //       setState(() {
          //         _mark.add(
          //           Marker(
          //             // markerId: MarkerId(x.id),
          //             position: LatLng(x.address.geo.lat, x.address.geo.lng),
          //           ),
          //         );
          //       });
          //       print("hehehe");
          //     },
          //   ),
          // ),
          GoogleMap(
            onMapCreated: _onMapCreated,
            // myLocationButtonEnabled: true,
            // myLocationEnabled: true,
            mapToolbarEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
            markers: Set.from(
              markers,
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {});
  }
}
