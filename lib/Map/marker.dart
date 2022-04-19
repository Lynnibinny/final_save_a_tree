/*----------------------------------------------------------------------------------
marker.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
  BuildContext context,
  String svgAssetLink, {
  Size size = const Size(20, 20),
}) async {
  String svgString = await DefaultAssetBundle.of(context).loadString(
    svgAssetLink,
  );
  final drawableRoot = await svg.fromSvgString(
    svgString,
    'debug: $svgAssetLink',
  );
  final ratio = ui.window.devicePixelRatio.ceil();
  final width = size.width.ceil() * ratio;
  final height = size.height.ceil() * ratio;
  final picture = drawableRoot.toPicture(
    size: Size(
      width.toDouble(),
      height.toDouble(),
    ),
  );
  final image = await picture.toImage(width, height);
  //final byteData = await (image.toByteData(format: ui.ImageByteFormat.png) as FutureOr<ByteData>);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final uInt8List = byteData!.buffer.asUint8List();
  return BitmapDescriptor.fromBytes(uInt8List);
}
