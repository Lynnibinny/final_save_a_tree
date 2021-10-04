import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:save_a_tree/Map/mapstyle.dart';
import 'package:save_a_tree/Map/marker.dart';
import 'package:save_a_tree/Map/coordinates.dart';

class StartMapWidget extends StatefulWidget {
  @override
  State<StartMapWidget> createState() => StartMapWidgetState();
}

class StartMapWidgetState extends State<StartMapWidget> {
  Set<Marker> _markers = {};
  Set<Polygon> _polygons = {};

  BitmapDescriptor customGreenMarker;
  BitmapDescriptor customRedMarker; //class for our custom Marker

  CameraPosition _initialCameraPosition = CameraPosition(
    //start position of the map
    target: LatLng(-27, -55),
    zoom: 8.5,
  );

  void _onMapCreated(GoogleMapController controller) {
    //set map's colors
    //GoogleMapController controller;
    controller.setMapStyle(MapStyle.mapStyle);
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

  void addGreenMarker(LatLng position) {
    int markerId = _markers.length;

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('$markerId'),
        position: position,
        icon: customGreenMarker,
      ));
    });
  }

  void addRedMarker(LatLng position) {
    int markerId = _markers.length;

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('$markerId'),
        position: position,
        icon: customRedMarker,
      ));
    });
  }

  //function to add a green Polygon to the list of polygons
  void addGreenPolygon(List position) {
    //use the current length of the list to give each polygon a unique id
    int _polygonId = _polygons.length;
    //print(_polygonId); //test to see if it works
    setState(() {
      _polygons.add(
        Polygon(
          polygonId: PolygonId('$_polygonId'),
          points: position,
          strokeColor: Colors.green.withOpacity(0.5),
          fillColor: Colors.green.withOpacity(0.5),
          strokeWidth: 2,
        ),
      );
    });
  }

  //function to add a red Polygon to the list of polygons
  void addRedPolygon(List position) {
    //use the current length of the list to give each polygon a unique id
    int _polygonId = _polygons.length;
    //print(_polygonId); //test to see if it works
    setState(() {
      _polygons.add(
        Polygon(
          polygonId: PolygonId('$_polygonId'),
          points: position,
          strokeColor: Colors.red.withOpacity(0.5),
          fillColor: Colors.red.withOpacity(0.5),
          strokeWidth: 2,
        ),
      );
    });
  }

  void createCustomMarker() async {
    // GoogleMapController controller;

    customGreenMarker =
        await getBitmapDescriptorFromSvgAsset(context, 'assets/Tree3.svg');
    customRedMarker =
        await getBitmapDescriptorFromSvgAsset(context, 'assets/TreeRed.svg');

    //Add areas to the list of polygons
    addGreenPolygon(fPuertoLeoni);
    addGreenPolygon(fProvincialPark);
    addRedPolygon(fColoniaDelicia);
    addRedPolygon(fTupambaE);
    addGreenPolygon(fChafariz);
    addRedPolygon(fTajyPoty);

    //Add markers to the list of markers
    addGreenMarker(mPuertoLeoni);
    addGreenMarker(mProvincialPark);
    addRedMarker(mColoniaDelicia);
    addRedMarker(mTupambaE);
    addGreenMarker(mChafariz);
    addRedMarker(mTajyPoty);
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
          //backgroundColor: Color.fromARGB(255, 170, 218, 255), //blue
          backgroundColor: Color.fromARGB(255, 189, 243, 195), //green
          //backgroundColor: Color(Colors.black);
          elevation: 0.0,
          title: Text(title,
              style: TextStyle(
                color: Colors.black,
              )),
        ),
        body: Center(
          child: _onMapCreated ==
                  null //customRedMarker == null || customGreenMarker == null
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
