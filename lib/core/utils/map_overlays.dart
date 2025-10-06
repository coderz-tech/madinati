// overlays.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// LatLng? _latLngFromPointGeometry(GeometryEntity? g) {
//   if (g?.type?.toLowerCase() == 'point' && (g?.coordinates?.length ?? 0) >= 2) {
//     return LatLng(g!.coordinates![1]!, g.coordinates![0]!); // lat, lon
//   }
//   return null;
// }

// Bin detection aligned with the new PropertiesEntity (id/isLifted) + PopupAttributes
// bool _isBin(PropertiesEntity? p, PopupAttributesEntity? popup) {
//   if (p == null) return false;
//   final hasId = (p.id?.trim().isNotEmpty ?? false);
//   final hasTag = (popup?.tag?.toString().trim().isNotEmpty ?? false);
//   final hasBinHints =
//       (popup?.binType?.trim().isNotEmpty ?? false) ||
//       (popup?.operationalPlanName?.trim().isNotEmpty ?? false);
//   return hasId || hasTag || hasBinHints;
// }

class MapOverlays {
  final Set<Marker> markers;
  final Set<Polyline> polylines;

  MapOverlays({required this.markers, required this.polylines});
}

/// يبني ماركرات للـ bins فقط (حسب النموذج الجديد)،
/// ويضيف start/end إن وُجدت، مع Polyline اختياري يمرّ عليها.
// Future<MapOverlays> buildOverlays({
//   required GeoJsonEntity geo,
//   required BuildContext context,
//   required MapIconCache icons,
//   LatLng? start,
//   LatLng? end,
//   String startMarkerId = 'start',
//   String endMarkerId = 'end',
//   bool drawPolyline = true,
//   String polylineId = 'route',
//   int lineWidth = 4,
// }) async {
//   await icons.load();
//
//   final markers = <Marker>{};
//   final polyPoints = <LatLng>[];
//
//   // 1) bins فقط من GeoJSON
//   final midPoints = <LatLng>[];
//   for (final f in (geo.features ?? const <FeatureEntity>[])) {
//     final pos = _latLngFromPointGeometry(f.geometry);
//     if (pos == null) continue;
//
//     final props = f.properties;
//     final popup = props?.popupAttributes;
//     if (!_isBin(props, popup)) continue;
//
//     midPoints.add(pos);
//
//     final isLifted = props?.isLifted ?? false;
//     final icon = isLifted ? icons.pinIconLifted! : icons.pinIconNotLifted!;
//
//     final tag = popup?.tag?.toString();
//     final size = popup?.binType?.toString(); // نوع الحاوية
//     final opName = popup?.operationalPlanName;
//     final title =
//         opName?.isNotEmpty == true
//             ? opName!
//             : AppLocalizations.of(context)!.bin;
//
//     final snippetParts = <String>[];
//     if (tag != null && tag.isNotEmpty) {
//       snippetParts.add('${AppLocalizations.of(context)!.tag}: $tag');
//     }
//     if (size != null && size.isNotEmpty) {
//       snippetParts.add('${AppLocalizations.of(context)!.size}: $size');
//     }
//     snippetParts.add(
//       isLifted
//           ? AppLocalizations.of(context)!.lifted
//           : AppLocalizations.of(context)!.notLifted,
//     );
//
//     markers.add(
//       Marker(
//         markerId: MarkerId(
//           (props?.id?.isNotEmpty ?? false)
//               ? props!.id!
//               : 'bin_${pos.latitude}_${pos.longitude}',
//         ),
//         position: pos,
//         icon: icon,
//         infoWindow: InfoWindow(title: title, snippet: snippetParts.join(' · ')),
//         zIndex: (props?.isVehicleLastPoint ?? false) ? 10 : 0,
//       ),
//     );
//   }
//
//   // 2) start/end markers
//   if (start != null) {
//     markers.add(
//       Marker(
//         markerId: MarkerId(startMarkerId),
//         position: start,
//         icon: icons.pinIconStart!,
//         infoWindow: const InfoWindow(title: 'Start'),
//       ),
//     );
//   }
//   if (end != null) {
//     markers.add(
//       Marker(
//         markerId: MarkerId(endMarkerId),
//         position: end,
//         icon: icons.pinIconEnd!,
//         infoWindow: const InfoWindow(title: 'End'),
//       ),
//     );
//   }
//
//   // 3) Polyline (اختياري): start -> bins -> end
//   if (drawPolyline) {
//     if (start != null) polyPoints.add(start);
//     polyPoints.addAll(midPoints);
//     if (end != null) polyPoints.add(end);
//
//     final polylines =
//         polyPoints.length >= 2
//             ? {
//               Polyline(
//                 polylineId: PolylineId(polylineId),
//                 points: polyPoints,
//                 width: lineWidth,
//               ),
//             }
//             : <Polyline>{};
//
//     return MapOverlays(markers: markers, polylines: polylines);
//   }
//
//   return MapOverlays(markers: markers, polylines: {});
// }
