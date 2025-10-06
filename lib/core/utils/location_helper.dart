import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationHelper {
  static driveToLocation({
    required double latitude,
    required double longitude,
  }) async {
    if (latitude == 0.0 && longitude == 0.0) {
      final url = 'https://www.google.com/maps';
      print(url);
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      final url =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      print(url);
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  static launchDirectionsLocations({required List<LatLng> listLatLng}) async {
    String url = "https://www.google.com/maps/dir/?api=1&waypoints=";
    for (int i = 0; i < listLatLng.length - 1; i++) {
      LatLng latLng = listLatLng[i];
      url = "$url${latLng.latitude},${latLng.longitude}|";
    }

    url =
        "$url&destination=${listLatLng[listLatLng.length - 1].latitude},${listLatLng[listLatLng.length - 1].longitude}&travelmode=driving";

    await launchUrl(Uri.parse(url));
  }

  static LatLng getCenter({required List<LatLng> points}) {
    double totalLat = 0;
    double totalLon = 0;
    for (LatLng point in points) {
      totalLat += point.latitude;
      totalLon += point.longitude;
    }
    double centerLat = totalLat / points.length;
    double centerLon = totalLon / points.length;

    return LatLng(centerLat, centerLon);
  }

  // static double distanceBetween({
  //   required double startLatitude,
  //   required double startLongitude,
  //   required double endLatitude,
  //   required double endLongitude,
  // }) {
  //   var earthRadius = 6378137.0;
  //   var dLat = _toRadians(endLatitude - startLatitude);
  //   var dLon = _toRadians(endLongitude - startLongitude);
  //
  //   var a = pow(sin(dLat / 2), 2) +
  //       pow(sin(dLon / 2), 2) *
  //           cos(_toRadians(startLatitude)) *
  //           cos(_toRadians(endLatitude));
  //   var c = 2 * asin(sqrt(a));
  //
  //   return earthRadius * c;
  // }
  //
  // static _toRadians(double degree) {
  //   return degree * pi / 180;
  // }
}
