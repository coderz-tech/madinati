import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

import '../../l10n/app_localizations.dart';

class Converter {
  static Future<BitmapDescriptor> bitmapDescriptorFromSvgAsset(
    String assetName, [
    ui.Size size = const ui.Size(24, 24),
  ]) async {
    final pictureInfo = await vg.loadPicture(SvgAssetLoader(assetName), null);

    double devicePixelRatio =
        ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    int width = (size.width * devicePixelRatio).toInt();
    int height = (size.height * devicePixelRatio).toInt();

    final scaleFactor = min(
      width / pictureInfo.size.width,
      height / pictureInfo.size.height,
    );

    final recorder = ui.PictureRecorder();

    ui.Canvas(recorder)
      ..scale(scaleFactor)
      ..drawPicture(pictureInfo.picture);

    final rasterPicture = recorder.endRecording();

    final image = rasterPicture.toImageSync(width, height);
    final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!;

    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }

  static double? convertToDouble(var value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else if (value is String) {
      return double.parse(value);
    } else {
      return null;
    }
  }

  static bool convertTBool(var value) {
    if (value is bool) {
      return value;
    } else {
      return bool.parse(value);
    }
  }

  static Future<http.Response> convertStreamedResponse({
    required http.StreamedResponse streamedResponse,
  }) async {
    // Read the response stream and collect the data
    final responseBytes = await streamedResponse.stream.toBytes();

    // Create a new Response object with the collected data
    return http.Response.bytes(
      responseBytes,
      streamedResponse.statusCode,
      request: streamedResponse.request,
      headers: streamedResponse.headers,
      isRedirect: streamedResponse.isRedirect,
      persistentConnection: streamedResponse.persistentConnection,
      reasonPhrase: streamedResponse.reasonPhrase,
    );
  }

  static Future<File> saveUint8ListToFile({
    required Uint8List data,
    required String filename,
  }) async {
    // Get the temporary directory
    final directory = await getTemporaryDirectory();

    // Create a File object with the desired file path
    final file = File('${directory.path}/$filename');

    // Write the Uint8List data to the file
    await file.writeAsBytes(data);

    // Return the file
    return file;
  }

  static String formatDate(String date) {
    return DateFormat('yyyy/MM/dd').format(DateTime.parse(date));
  }

  static String formatTime(String time) {
    return DateFormat('hh:mm a').format(DateTime.parse(time));
  }

  static String formatDateTime(String dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.parse(dateTime));
  }

  static String formatDateTimeWithoutLine(String dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.parse(dateTime));
  }

  static String? differentBetweenCurrentDateTimeAndGivenDateTime({
    required String dateTime,
  }) {
    try {
      DateTime slaDate = DateTime.parse(dateTime);
      DateTime currentDate = DateTime.now();

      Duration remainingTime = slaDate.difference(currentDate);
      int remainingHours = remainingTime.inHours;
      if (remainingHours < 0) {
        remainingHours = 0;
      }
      return remainingHours.toString();
    } catch (error) {
      return null;
    }
  }

  // static List<BinItem> buildBinItemsFromGeoJsonOnlyBins({
  //   required GeoJsonEntity geo,
  //   required BuildContext context,
  //   int? tripStatus,
  // }) {
  //   final features = geo.features ?? const [];
  //   final items = <BinItem>[];
  //
  //   for (final f in features) {
  //     final props = f.properties;
  //     final popup = props?.popupAttributes;
  //     if (!_isBin(props, popup)) continue;
  //
  //     // geometry -> lat/lng (GeoJSON Point = [lng, lat])
  //     double? lat, lon;
  //     final g = f.geometry;
  //     if (g?.type?.toLowerCase() == 'point' &&
  //         (g?.coordinates?.length ?? 0) >= 2) {
  //       lon = g!.coordinates![0];
  //       lat = g.coordinates![1];
  //     }
  //
  //     items.add(
  //       BinItem(
  //         tagNumber: popup?.tag,
  //         isLifted: props?.isLifted ?? false,
  //         type: AppLocalizations.of(context)!.bin,
  //         // (no PropertiesEntity.type in new model)
  //         size: popup?.binType,
  //         // نوع الحاوية
  //         status:
  //             (props?.isLifted ?? false)
  //                 ? AppLocalizations.of(context)!.lifted
  //                 : AppLocalizations.of(context)!.notLifted,
  //         latitude: lat,
  //         longitude: lon,
  //       ),
  //     );
  //   }
  //   return items;
  // }
  //
  // static bool _isBin(PropertiesEntity? p, PopupAttributesEntity? popup) {
  //   if (p == null) return false;
  //   final hasId = (p.id?.trim().isNotEmpty ?? false);
  //   final hasTag = (popup?.tag?.toString().trim().isNotEmpty ?? false);
  //   final hasBinHints =
  //       (popup?.binType?.trim().isNotEmpty ?? false) ||
  //       (popup?.operationalPlanName?.trim().isNotEmpty ?? false);
  //   return hasId || hasTag || hasBinHints;
  // }
  //
  // static LatLng? getLatLngByPointName(GeoJsonEntity? geoJson, String keyName) {
  //   if (geoJson?.features == null) return null;
  //
  //   for (final feature in geoJson!.features!) {
  //     final coords = feature.geometry?.coordinates;
  //     final props = feature.properties;
  //     final propsString = [
  //       props?.overnightPoint,
  //       props?.disposalPoint,
  //       props?.id,
  //       props?.tag,
  //       props?.popupAttributes?.operationalPlanName,
  //       props?.popupAttributes?.binType,
  //       props?.popupAttributes?.tag,
  //     ].whereType<String>().join(' | ');
  //
  //     if (propsString.contains(keyName) &&
  //         coords != null &&
  //         coords.length >= 2 &&
  //         (feature.geometry?.type?.toLowerCase() == 'point')) {
  //       return LatLng(coords[1]!, coords[0]!); // lat, lon
  //     }
  //   }
  //   return null;
  // }

  static String timeAgo(String dateTimeString, {String locale = "en"}) {
    DateTime inputTime = DateTime.parse(dateTimeString);
    Duration diff = DateTime.now().difference(inputTime);

    int minutes = diff.inMinutes;
    int hours = diff.inHours;
    int days = diff.inDays;

    switch (locale) {
      case "ar": // Arabic
        if (minutes < 60) return "$minutes د";
        if (hours < 24) return "$hours س";
        return "$days ي";

      case "ur": // Urdu
        if (minutes < 60) return "$minutes منٹ";
        if (hours < 24) return "$hours گھنٹے";
        return "$days دن";

      case "hi": // Hindi
        if (minutes < 60) return "$minutes मि";
        if (hours < 24) return "$hours घं";
        return "$days दिन";

      default: // English
        if (minutes < 60) return "${minutes}m";
        if (hours < 24) return "${hours}h";
        return "${days}d";
    }
  }
}
