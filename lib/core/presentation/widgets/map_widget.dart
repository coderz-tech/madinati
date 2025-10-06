import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../utils/map_icon_cache.dart';
import '../../utils/map_overlays.dart';
import '../../utils/responsive.dart';

class MapWidget extends StatefulWidget {
  // final GeoJsonEntity? geo;
  final LatLng? start; // راح تبعثهم أنت
  final LatLng? end;
  final bool showAppBar;

  const MapWidget({
    super.key,
    // required this.geo,
    this.start,
    this.end,
    this.showAppBar = false,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final _controller = Completer<GoogleMapController>();
  final _icons = MapIconCache();

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  static const _fallback = CameraPosition(
    target: LatLng(21.4858, 39.1925),
    zoom: 11,
  );

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    print("widget.geo!=null");
    // if (widget.geo != null) {
    //   print("widget.geo!=null");
    //   final overlays = await buildOverlays(
    //     context: context,
    //     geo: widget.geo!,
    //     icons: _icons,
    //     start: widget.start,
    //     end: widget.end,
    //     drawPolyline: true,
    //   );
    //
    //   setState(() {
    //     _markers = overlays.markers;
    //     _polylines = overlays.polylines;
    //   });
    // }
    final bounds = _computeBounds();
    if (bounds != null) {
      final c = await _controller.future;
      await c.animateCamera(CameraUpdate.newLatLngBounds(bounds, 60));
    }
  }

  LatLngBounds? _computeBounds() {
    final pts = <LatLng>[
      ..._markers.map((m) => m.position),
      ..._polylines.expand((p) => p.points),
    ];
    if (pts.isEmpty) return null;
    double minLat = pts.first.latitude, maxLat = pts.first.latitude;
    double minLng = pts.first.longitude, maxLng = pts.first.longitude;
    for (final p in pts) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLng) minLng = p.longitude;
      if (p.longitude > maxLng) maxLng = p.longitude;
    }
    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showAppBar) {
      return Scaffold(
        appBar: AppBar(
          /// fixme modify the top container to have opacity and gradient with using stack
          toolbarHeight: responsiveHeight(context, 50),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
                  Theme.of(context).colorScheme.primary.withValues(alpha: 1.0),
                ],
              ),
            ),
          ),
          iconTheme: Theme.of(
            context,
          ).appBarTheme.iconTheme!.copyWith(size: 18.sp),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: GoogleMap(
          initialCameraPosition: _fallback,
          onMapCreated: (c) => _controller.complete(c),
          markers: _markers,
          // polylines: _polylines,
          myLocationEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          compassEnabled: true,
          
        ),
      );
    } else {
      return GoogleMap(
        initialCameraPosition: _fallback,
        onMapCreated: (c) => _controller.complete(c),
        markers: _markers,
        // polylines: _polylines,
        myLocationEnabled: false,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        compassEnabled: true,
      );
    }
  }
}
