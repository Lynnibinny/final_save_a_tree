import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:save_a_tree/mapStyle.dart';
import 'package:save_a_tree/Map/marker.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Set<Marker> markers = {};
  Set<Polygon> _polygons = {};

  final List<LatLng> posPolygon_1 = [
    LatLng(-50, -50),
    LatLng(-30.196338, -50),
    LatLng(-20, -20),
    LatLng(-40, -40),
  ];

  PolygonId _polygonId = PolygonId('1');

  BitmapDescriptor customMarker;

  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(50, 70),
    zoom: 2,
  );

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapStyle.mapStyle);
  }

  void _ontap(LatLng position) {
    int markerId = markers.length + 1;
    setState(() {
      markers.add(Marker(
        markerId: new MarkerId('$markerId'),
        position: position,
        icon: customMarker,
      ));
    });
    //print(markerId);
  }

  void addPolygon() {
    setState(() {
      _polygons.add(
        Polygon(
          polygonId: _polygonId,
          points: posPolygon_1,
          strokeColor: Colors.green.withOpacity(0.5),
          fillColor: Colors.green.withOpacity(0.5),
          strokeWidth: 3,
        ),
      );
    });
  }

  void createCustomMarker() async {
    customMarker =
        await getBitmapDescriptorFromSvgAsset(context, 'assets/Tree3.svg');
  }

  @override
  void initState() {
    super.initState();
    createCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Karte';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text(title,
              style: TextStyle(
                color: Colors.black,
              )),
        ),
        //appBar: AppBar(title: Text('Map')),
        body: GoogleMap(
          markers: markers,
          polygons: _polygons,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: _onMapCreated,
          onTap: _ontap,
        ),
      ),
    );
  }
}
