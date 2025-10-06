import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapIconCache {
  BitmapDescriptor? pinIconLifted;
  BitmapDescriptor? pinIconNotLifted;
  BitmapDescriptor? pinIconStart;
  BitmapDescriptor? pinIconEnd;

  Future<void> load() async {
    pinIconLifted ??= await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/pngs/trash.png',
    );
    pinIconNotLifted ??= await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/pngs/trash_red.png',
    );
    pinIconStart ??= await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/pngs/flag.png',
    );
    pinIconEnd ??= await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/pngs/location-minus.png',
    );
  }
}
