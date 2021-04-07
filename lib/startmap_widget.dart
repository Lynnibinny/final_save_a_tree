import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class StartMapWidget extends StatefulWidget {
  @override
  State<StartMapWidget> createState() => StartMapWidgetState();
}

class StartMapWidgetState extends State<StartMapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  MapType type;
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-38, -70),
    zoom: 4,
  );

  @override
  void initState() {
    super.initState();
    type = MapType.hybrid;
    markers = Set.from([]);
  }

  Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: markers,
            mapType: type,
            onTap: (position) {
              Marker mk1 = Marker(
                markerId: MarkerId('1'),
                position: position,
              );
              setState(() {
                markers.add(mk1);
              });
            },
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          //SizedBox(child: Image.asset('assets/baum.jpg', fit: BoxFit.contain)),
        ],
      ),
    );
  }
}
