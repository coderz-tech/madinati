import 'package:google_maps_flutter/google_maps_flutter.dart';

class OperationPlanEntity {
  int? id;
  String? arabicName;
  String? englishName;
  int? crLicenseId;
  String? finalDestinationNameLocation;
  int? applicationId;
  int? vehicleId;
  int? manPowerId;
  int? finalDestinationId;
  String? vehicleName;
  String? manPowerName;
  String? finalDestinationName;
  int? operationPlanClassificationTypeId;
  String? operationPlanType;

  String? fromDate;
  String? toDate;
  String? requiredDayDescription;
  String? fromDateFormatted;
  String? toDateFormatted;
  String? fromTime;
  String? toTime;
  String? requiredDays;
  String? vehicleInfo;
  String? avlTrackingCompanyName;
  bool? isActive;
  String? startingPointName;
  double? startingPointLongitude;
  double? startingPointLatitude;
  BitmapDescriptor? startPointBitmapDescriptor;
  BitmapDescriptor? endPointBitmapDescriptor;

  String? wasteType;
  String? name;
  String? code;

  String? licenseNumber;
  String? vehicleBrand;
  String? avlCompanyName;
  String? wasteTypeName;
  int? wasteTypeCode;
  String? municipalityName;
  int? municipalityId;
  String? subMunicipalityName;
  String? createdById;
  String? createdOn;

  double? finalDestinationLongitude;
  double? finalDestinationLatitude;

  OperationPlanEntity({
    this.id,
    this.finalDestinationLatitude,
    this.finalDestinationLongitude,
    this.avlCompanyName,
    this.createdById,
    this.createdOn,
    this.licenseNumber,
    this.municipalityName,
    this.municipalityId,
    this.subMunicipalityName,
    this.vehicleBrand,
    this.wasteTypeCode,
    this.wasteTypeName,
    this.arabicName,
    this.englishName,
    this.crLicenseId,
    this.operationPlanType,
    this.applicationId,
    this.endPointBitmapDescriptor,
    this.startPointBitmapDescriptor,
    this.vehicleId,
    this.code,
    this.finalDestinationNameLocation,
    this.manPowerId,
    this.finalDestinationId,
    this.vehicleName,
    this.manPowerName,
    this.finalDestinationName,
    this.operationPlanClassificationTypeId,
    this.fromDate,
    this.toDate,
    this.requiredDayDescription,
    this.fromDateFormatted,
    this.toDateFormatted,
    this.fromTime,
    this.toTime,
    this.requiredDays,
    this.vehicleInfo,
    this.avlTrackingCompanyName,
    this.isActive,
    this.startingPointName,
    this.startingPointLongitude,
    this.startingPointLatitude,
    this.wasteType,
    this.name,
  });
}
