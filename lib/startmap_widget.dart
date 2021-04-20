import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:save_a_tree/mapStyle.dart';
import 'package:save_a_tree/marker.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Set<Marker> markers = {};

  late BitmapDescriptor customMarker;

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
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: GoogleMap(
        markers: markers,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: _onMapCreated,
        onTap: _ontap,
      ),
    );
  }
}
