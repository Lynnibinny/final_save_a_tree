/*----------------------------------------------------------------------------------
coordinates.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:google_maps_flutter/google_maps_flutter.dart';

final List<LatLng> fPuertoLeoni = [
  //Polygon's edges
  LatLng(-26.9701194, -55.191528),
  LatLng(-26.974547, -55.190064),
  LatLng(-26.973308, -55.185219),
  LatLng(-26.968797, -55.186753),
];

final List<LatLng> fProvincialPark = [
  LatLng(-26.9417833, -54.9236667),
  LatLng(-26.9417847, -54.9095361),
  LatLng(-26.9612139, -54.9223056),
  LatLng(-26.9559028, -54.9362750),
];

final List<LatLng> fColoniaDelicia = [
  LatLng(-27.23813056, -54.38782778),
  LatLng(-27.23260556, -54.35243889),
  LatLng(-27.23967222, -54.35005),
  LatLng(-27.24286667, -54.357375),
  LatLng(-27.24620556, -54.35780833),
  LatLng(-27.25083889, -54.34773611),
  LatLng(-27.25454444, -54.34881667),
  LatLng(-27.24928333, -54.36295278),
  LatLng(-27.24089722, -54.362725),
  LatLng(-27.24531389, -54.38560833),
];

final List<LatLng> fTupambaE = [
  LatLng(-26.99685, -55.057425),
  LatLng(-26.99925833, -55.05991944),
  LatLng(-27.00076389, -55.05899722),
  LatLng(-26.99992778, -55.0604638),
  LatLng(-27.00327222, -55.06044167),
  LatLng(-27.008075, -55.05334167),
  LatLng(-27.00616389, -55.05259722),
  LatLng(-27.00416667, -55.05451944),
  LatLng(-27.00243611, -55.05400278),
  LatLng(-27.00140833, -55.05663611),
  LatLng(-27.00081944, -55.05653611),
  LatLng(-27.00132222, -55.054225),
  LatLng(-27.00073611, -55.05390833),
  LatLng(-27.00128611, -55.05217778),
  LatLng(-26.99974722, -55.05150833),
  LatLng(-26.99835556, -55.04930556),
];

final List<LatLng> fChafariz = [
  LatLng(-26.9816000, -55.0939639),
  LatLng(-26.9819528, -55.1143861),
  LatLng(-27.0010444, -55.1150278),
  LatLng(-27.0007028, -55.0973583),
];

final List<LatLng> fSantoPipo = [
  LatLng(-27.0623750, -55.0494333),
  LatLng(-27.0623583, -55.0519472),
  LatLng(-27.0646111, -55.0519333),
  LatLng(-27.0645139, -55.0548667),
  LatLng(-27.0665528, -55.0554611),
  LatLng(-27.0712056, -55.0551194),
  LatLng(-27.0711000, -55.0484111),
  LatLng(-27.0679028, -55.0482222),
];

/*final List<LatLng> fTakuapi02 = [  //(!) don't delete 
  LatLng(-27.0047750, -55.0736611),
  LatLng(-26.9938111, -55.0739278),
  LatLng(-26.9937139, -55.0792139),
  LatLng(-27.0064500, -55.0793861),
];
*/

final List<LatLng> fTakuapi = [
  LatLng(-26.9937139, -55.0792139),
  LatLng(-26.9968778, -55.0792556),
  LatLng(-26.9969444, -55.0774639),
  LatLng(-26.9941194, -55.0773611),
];

/*final List<LatLng> fGuavirami = [
  LatLng(-27.0087889, -54.9657278),
  LatLng(-27.0017556, -54.9664222),
  LatLng(-27.0091611, -54.9537972),
  LatLng(-27.0153556, -54.9532139),
];
*/

final List<LatLng> fGuavirami = [
  LatLng(-27.0017556, -54.9664222),
  LatLng(-27.0087889, -54.9657278),
  LatLng(-27.0091611, -54.9537972),
  LatLng(-26.9986889, -54.9532639),
];

final List<LatLng> fTapeMiri = [
  LatLng(-26.9401861, 	-54.9361250),
  LatLng(-54.9361250, 	-54.9332917),
  LatLng(-26.0075417, 	-54.0163750),
  LatLng(-26.0099917, 	-54.9000139),
  LatLng(-26.0114722, 	-54.9324806),
  LatLng(-26.0112639, 	-54.0135667),
  LatLng(-26.0123000, 	-54.0102278),
  LatLng(-26.0104694,	  -54.0093056),
  LatLng(-26.0090750,	  -54.0063528),
  LatLng(-26.0087500, 	-54.0053250),
  LatLng(-26.0101194, 	-54.0047639),
  LatLng(-26.0109917, 	-54.0042389),
  LatLng(-26.0113889, 	-54.0023583),
  LatLng(-26.0163306, 	-54.8971000),
  LatLng(-26.9550861, 	-54.8974056),
  LatLng(-26.0055472, 	-54.9052778),
  LatLng(-26.0032778, 	-54.0067250),
  LatLng(-26.0031694, 	-54.0113556),
  LatLng(-26.0038528, 	-54.0120333),
  LatLng(-26.0037139, 	-54.0128167),
  LatLng(-26.0044778, 	-54.0135694),
  LatLng(-26.0044556, 	-54.0144111),
  LatLng(-26.0038806, 	-54.0148944),
  LatLng(-26.9478917, 	-54.9386389),
];

LatLng mPuertoLeoni = LatLng(-26.969627380371094, -55.189170837402344);
LatLng mProvincialPark = LatLng(-26.945327758789062, -54.92672348022461);
LatLng mColoniaDelicia = LatLng(-27.24620556, -54.35780833);
LatLng mTupambaE = LatLng(-27.00416667, -55.05451944);
LatLng mChafariz = LatLng(-26.9816000, -55.0939639);
LatLng mSantoPipo = LatLng(-27.0623750, -55.0494333);
LatLng mTakuapi = LatLng(-26.9937139, -55.0792139); //Another Takuapí02 supposed to be 70 Ha, exact coordinates
LatLng mGuavirami = LatLng(-27.0017556, -54.9664222); //121 Ha, only one coordinate known
LatLng mTapeMiri = LatLng(-26.9401861, 	-54.9361250); //313 Ha, pictures
