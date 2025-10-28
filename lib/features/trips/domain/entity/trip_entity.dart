import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:madinati/features/trips/domain/entity/trip_final_destination_entity.dart';

class TripEntity {
  String? code;
  String? planCode;
  String? vehicleBrand;
  String? tripName;
  String? wasteType;
  String? avlTrackingCompanyName;
  String? vehicleInfo;
  String? vehicleCode;
  String? driverName;
  String? manPowerCode;
  String? finalDestinationName;
  String? finalDestinationCode;
  String? finalDestiantionLocation;
  String? regularityPercentage;
  String? completetionPercentage;
  String? tripStartTime;
  String? tripEndTime;
  String? actualStartDate;
  String? actualStartTime;
  String? delayTime;
  String? tripDate;
  String? tripDay;
  bool? isLoaded;
  BitmapDescriptor? startPointBitmapDescriptor;
  BitmapDescriptor? endPointBitmapDescriptor;
  String? operationPlanType;
  String? startingPointName;
  double? startingPointLongitude;
  double? startingPointLatitude;
  double? manualCompletionToleranceInMeters;
  List<TripFinalDestinationEntity>? finalDestiantionPoints;

  TripEntity({
    this.code,
    this.planCode,
    this.vehicleBrand,
    this.manualCompletionToleranceInMeters,
    this.tripName,
    this.wasteType,
    this.tripDate,
    this.tripDay,
    this.avlTrackingCompanyName,
    this.vehicleInfo,
    this.vehicleCode,
    this.driverName,
    this.manPowerCode,
    this.startPointBitmapDescriptor,
    this.endPointBitmapDescriptor,
    this.finalDestinationName,
    this.finalDestinationCode,
    this.finalDestiantionLocation,
    this.regularityPercentage,
    this.completetionPercentage,
    this.tripStartTime,
    this.tripEndTime,
    this.actualStartDate,
    this.actualStartTime,
    this.delayTime,
    this.isLoaded,
    this.operationPlanType,
    this.startingPointName,
    this.startingPointLongitude,
    this.startingPointLatitude,
    this.finalDestiantionPoints,
  });
}
