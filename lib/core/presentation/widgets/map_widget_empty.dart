import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidgetEmpty extends StatefulWidget {
  const MapWidgetEmpty({super.key});

  @override
  State<MapWidgetEmpty> createState() => _MapWidgetEmptyState();
}

class _MapWidgetEmptyState extends State<MapWidgetEmpty> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(21.4858, 39.1925),
        zoom: 11,
      ),
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      compassEnabled: true,
    );
  }
}
