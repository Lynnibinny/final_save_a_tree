import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:save_a_tree/mapStyle.dart';
import 'package:save_a_tree/Map/mapstyle.dart';
import 'package:save_a_tree/Map/marker.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Set<Marker> _markers = {};
  Set<Polygon> _polygons = {};

  //Test
  /*
  final List<LatLng> posPolygon_1 = [
    //Polygon's edges
    LatLng(-50, -50),
    LatLng(-30.196338, -50),
    LatLng(-20, -100),
    LatLng(-100, -40),
  ];
  */

  final List<LatLng> pos25ha = [
    //Polygon's edges
    LatLng(-26.9701194, -55.191528),
    LatLng(-26.974547, -55.190064),
    LatLng(-26.973308, -55.185219),
    LatLng(-26.968797, -55.186753),
  ];

  final List<LatLng> pos300ha = [
    //Polygon's edges
    LatLng(-26.9417833, -54.9236667),
    LatLng(-26.9417847, -54.9095361),
    LatLng(-26.9612139, -54.9223056),
    LatLng(-26.9559028, -54.9362750),
  ];

  LatLng posMarker1 = LatLng(-26.969627380371094, -55.189170837402344);
  LatLng posMarker2 = LatLng(-26.945327758789062, -54.92672348022461);
  //LatLng posMarker = LatLng(, );

  //PolygonId _polygonId = PolygonId('1');

  BitmapDescriptor customMarker; //class for our custom Marker

  CameraPosition _initialCameraPosition = CameraPosition(
    //start position of the map
    target: LatLng(-27, -55),
    zoom: 5,
  );

  void _onMapCreated(GoogleMapController controller) {
    //set map's colors
    //GoogleMapController controller;
    controller.setMapStyle(MapStyle.mapStyle);
    /* addPolygon(pos25ha);
    addPolygon(pos300ha);
    addMarker(posMarker1);
    addMarker(posMarker2); */
  }

  /* //Test
  void _ontap(LatLng position) {
    //Add a marker where tapped
    int markerId = _markers.length + 1;
    setState(() {
      _markers.add(Marker(
        markerId: new MarkerId('$markerId'),
        position: position,
        icon: customMarker,
      ));
    });
    //print(markerId); //test to see if id-assignement to the markers works
  }
  */

  void addMarker(LatLng position) {
    int markerId = _markers.length + 1;

    //child: CircularProgressIndicator(),
    //customMarker == null
    // ? CircularProgressIndicator()
    //:
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('$markerId'),
        position: position,
        icon: customMarker,
      ));
    });
  }

  void addPolygon(List position) {
    //add Polygon on the map
    int _polygonId = _polygons.length;
    print(_polygonId);
    setState(() {
      _polygons.add(
        Polygon(
          polygonId: PolygonId('$_polygonId'), //_polygonId,
          points: position,
          strokeColor: Colors.green.withOpacity(0.5),
          fillColor: Colors.green.withOpacity(0.5),
          strokeWidth: 3,
        ),
      );
    });
  }

  void createCustomMarker() async {
    // GoogleMapController controller;

    customMarker =
        await getBitmapDescriptorFromSvgAsset(context, 'assets/Tree3.svg');

    //  await controller.setMapStyle(MapStyle.mapStyle);
    addPolygon(pos25ha);
    addPolygon(pos300ha);
    addMarker(posMarker1);
    addMarker(posMarker2);
  }

  @override
  void initState() {
    createCustomMarker();
    //_onMapCreated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Karte';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 170, 218, 255),
          elevation: 0.0,
          title: Text(title,
              style: TextStyle(
                color: Colors.black,
              )),
        ),
        //appBar: AppBar(title: Text('Map')),
        body: Center(
          //child: CircularProgressIndicator(),
          child: customMarker == null
              ? CircularProgressIndicator()
              : GoogleMap(
                  markers: _markers,
                  polygons: _polygons,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: _onMapCreated,
                  //onMapCreated: createCustomMarker,
                  //onTap: _ontap,
                ),
        ),
      ),
    );
  }
}
