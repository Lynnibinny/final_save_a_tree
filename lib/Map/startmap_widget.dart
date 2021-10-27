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

  /*//Test
  void _ontap(LatLng position) {
    //Add a marker where tapped
    int markerId = _markers.length + 1;
    setState(() {
      _markers.add(Marker(
        markerId: new MarkerId('$markerId'),
        position: position,
        icon: customGreenMarker,
        infoWindow: InfoWindow(title: "hi"),
      ));
    });
    //print(markerId); //test to see if id-assignement to the markers works
  }
  */

  void addGreenMarker(LatLng position, String name) {
    int markerId = _markers.length;

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('$markerId'),
        position: position,
        icon: customGreenMarker,
        infoWindow: InfoWindow(title: "$name"),
      ));
    });
  }

  void addRedMarker(LatLng position, String name) {
    int markerId = _markers.length;

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('$markerId'),
        position: position,
        icon: customRedMarker,
        infoWindow: InfoWindow(title: "$name"),
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
    //addGreenPolygon(fPuertoLeoni);
    addRedPolygon(fProvincialPark); //for sale
    //addRedPolygon(fColoniaDelicia);
    addGreenPolygon(fTupambaE); //bought
    addRedPolygon(fChafariz); //for sale
    //addRedPolygon(fTajyPoty);
    //addRedPolygon(fTakuapi);
    addGreenPolygon(fGuavirami); //bought
    //Amba'y Poty MISSING (bought)
    //Santo Pipo MISSING (bought)
    //Tekoa Guapo'y Poty MISSING (for sale)

    //Add markers to the list of markers
    //addGreenMarker(mPuertoLeoni);
    addRedMarker(
        mProvincialPark, "Am Rand des Provinzparks „Valle del Cuña Pirú“");
    //addRedMarker(mColoniaDelicia);
    addGreenMarker(mTupambaE, "Tupamba'é");
    addRedMarker(mChafariz, "Wald am Chafaríz, nahe Soberbio");
    //addRedMarker(mTajyPoty);
    //addRedMarker(mTakuapi);
    addGreenMarker(mGuavirami, "Gemeinschaft Guaviramí");
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
                  //onTap: _ontap, //Test
                ),
        ),
      ),
    );
  }
}
