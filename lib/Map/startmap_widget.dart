import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:save_a_tree/mapStyle.dart';
import 'package:save_a_tree/Map/mapstyle.dart';
import 'package:save_a_tree/Map/marker.dart';

class StartMapWidget extends StatefulWidget {
  @override
  State<StartMapWidget> createState() => StartMapWidgetState();
}

class StartMapWidgetState extends State<StartMapWidget> {
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

  final List<LatLng> fPuertoLeoni = [
    //Polygon's edges
    LatLng(-26.9701194, -55.191528),
    LatLng(-26.974547, -55.190064),
    LatLng(-26.973308, -55.185219),
    LatLng(-26.968797, -55.186753),
  ];

  final List<LatLng> fProvincialPark = [
    //Polygon's edges
    LatLng(-26.9417833, -54.9236667),
    LatLng(-26.9417847, -54.9095361),
    LatLng(-26.9612139, -54.9223056),
    LatLng(-26.9559028, -54.9362750),
  ];

  final List<LatLng> fColoniaDelicia = [
    //Polygon's edges
    LatLng(27.23813056, 54.38782778),
    LatLng(27.23260556, 54.35243889),
    LatLng(27.23967222, 54.35005),
    LatLng(27.24286667, 54.357375),
    LatLng(27.24620556, 54.35780833),
    LatLng(27.25083889, 54.34773611),
    LatLng(27.25454444, 54.34881667),
    LatLng(27.24928333, 54.36295278),
    LatLng(27.24089722, 54.362725),
    LatLng(27.24531389, 54.38560833),
  ];

  final List<LatLng> fTupambaE = [
    //Polygon's edges
    LatLng(26.99685, 26.057425),
    LatLng(26.99925833, 26.05991944),
    LatLng(27.00076389, 27.05899722),
    LatLng(26.99992778, 26.0604638),
    LatLng(27.00327222, 27.06044167),
    LatLng(27.008075, 27.05334167),
    LatLng(27.00616389, 27.05259722),
    LatLng(27.00416667, 27.05451944),
    LatLng(27.00243611, 27.05400278),
    LatLng(27.00140833, 27.05663611),
    LatLng(27.00081944, 27.05653611),
    LatLng(27.00132222, 27.054225),
    LatLng(27.00073611, 27.05390833),
    LatLng(27.00128611, 27.05217778),
    LatLng(26.99974722, 26.05150833),
    LatLng(26.99835556, 26.04930556),
  ];

  LatLng mPuertoLeoni = LatLng(-26.969627380371094, -55.189170837402344);
  LatLng mProvincialPark = LatLng(-26.945327758789062, -54.92672348022461);
  LatLng mColoniaDelicia = LatLng(27.24620556, 54.35780833);
  LatLng mTupambaE = LatLng(27.00416667, 27.05451944);

  //LatLng posMarker = LatLng(, );

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
    int markerId = _markers.length;

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
    //function to add a Polygon to the list of polygons
    int _polygonId = _polygons
        .length; //use the current length of the list to give each polygon a unique id
    //print(_polygonId); //test to see if it works
    setState(() {
      _polygons.add(
        Polygon(
          polygonId: PolygonId('$_polygonId'),
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
    addPolygon(fPuertoLeoni); //Add areas to the list of polygons
    addPolygon(fProvincialPark);
    addPolygon(fColoniaDelicia);
    addPolygon(fTupambaE); //Add markers to the list of markers
    addMarker(mPuertoLeoni);
    addMarker(mProvincialPark);
    addMarker(mColoniaDelicia);
    addMarker(mTupambaE);
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
        body: Center(
          child: customMarker == null
              ? CircularProgressIndicator()
              : GoogleMap(
                  markers: _markers,
                  polygons: _polygons,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: _onMapCreated,
                ),
        ),
      ),
    );
  }
}
