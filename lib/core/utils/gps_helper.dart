import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

enum ErrorLocation { serviceNotEnabled, permissionNotGranted }

class GpsHelper {
  static Future<LocationData> getLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw ErrorLocation.serviceNotEnabled;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw ErrorLocation.permissionNotGranted;
      }
    }
    return await location.getLocation();
  }

  static String distanceBetween({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    double distanceInMeters = Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
    double distanceInKm = distanceInMeters / 1000;

    return "${distanceInKm.toStringAsFixed(3)} km";
  }
}
