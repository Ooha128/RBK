import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:rbk/ExamplePop.dart';

class SimpleMapWithPopups extends StatefulWidget {
  @override
  State<SimpleMapWithPopups> createState() => _SimpleMapWithPopupsState();
}

class _SimpleMapWithPopupsState extends State<SimpleMapWithPopups> {
  List<LatLng> _markerPositions = [];

  /// Used to trigger showing/hiding of popups.
  final PopupController _popupLayerController = PopupController();

  @override
  Widget build(BuildContext context) {
    //print(_markers(context));
    //Marker m = _markers(context)[1];
    //print(_markers(context).indexOf(m));
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          zoom: 5.0,
          center: LatLng(16.517, 80.610),
          plugins: [
            // PopupMarkerPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          PopupMarkerLayerOptions(
            popupController: _popupLayerController,
            markers: _markers(context),
            markerRotateAlignment:
                PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
            popupBuilder: (BuildContext context, Marker marker) =>
                ExamplePopup(marker, _markers(context).indexOf(marker)),
          ),
        ],
      ),
    );
  }

  final List<LatLng> locList = [];

  final List<List<String>> propList = [];

  List<Marker> _markers(BuildContext context) {
    _markerPositions = [
      LatLng(16.469605, 80.740970),
      LatLng(16.486113, 80.663636),
      LatLng(16.439151, 80.744749)
    ];
    List<Marker> mp = [];
    for (int i = 0; i < _markerPositions.length; i++) {
      mp.add(Marker(
        point: _markerPositions[i],
        width: 40,
        height: 40,
        builder: (_) => IconButton(
          icon: const Icon(Icons.location_on, size: 40),
          onPressed: () {
            print("hello");
            showContent(context, i);
          },
        ),
        anchorPos: AnchorPos.align(AnchorAlign.top),
      ));
    }
    return mp;
  }

  void showContent(context, int i) {
    final List<List<String>> objectProperties = [
      ['Ganguru', 'RBK'],
      ['Yanamalakuduru', 'RBK'],
      ['Gosala', 'RBK']
    ];
    showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!

        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(objectProperties[i][0]),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(objectProperties[i][1]),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
