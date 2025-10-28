import '../../../../core/utils/converter.dart';
import '../../domain/entity/operation_plan_entity.dart';

class OperationPlanModel extends OperationPlanEntity{
  OperationPlanModel({
    super.applicationId,
    super.arabicName,
    super.startPointBitmapDescriptor,
    super.endPointBitmapDescriptor,
    super.finalDestinationNameLocation,
    super.name,
    super.avlTrackingCompanyName,
    super.wasteType,
    super.crLicenseId,
    super.englishName,
    super.operationPlanType,
    super.finalDestinationId,
    super.finalDestinationName,
    super.fromDate,
    super.fromDateFormatted,
    super.fromTime,
    super.code,
    super.id,
    super.isActive,
    super.manPowerId,
    super.manPowerName,
    super.operationPlanClassificationTypeId,
    super.requiredDays,
    super.toDate,
    super.toDateFormatted,
    super.toTime,
    super.vehicleId,
    super.vehicleInfo,
    super.vehicleName,
    super.requiredDayDescription,
    super.startingPointLatitude,
    super.startingPointLongitude,
    super.startingPointName,
  });

  factory OperationPlanModel.fromJson({
    required Map<dynamic, dynamic> json,
  }) {
    OperationPlanModel operationPlansModel = OperationPlanModel();
    operationPlansModel.id = json['id'];
    operationPlansModel.finalDestinationNameLocation =
    json['finalDestinationNameLocation'];
    operationPlansModel.arabicName = json['arabicName'];
    operationPlansModel.operationPlanType = json['operationPlanType'];
    operationPlansModel.startingPointLatitude =
        Converter.convertToDouble(json['startingPointLatitude']);
    operationPlansModel.startingPointLongitude =
        Converter.convertToDouble(json['startingPointLongitude']);
    operationPlansModel.requiredDayDescription = json['requiredDayDescription'];
    operationPlansModel.startingPointName = json['startingPointName'];
    operationPlansModel.vehicleName = json['vehicleName'];
    operationPlansModel.wasteType = json['wasteType'];
    operationPlansModel.avlTrackingCompanyName = json['avlTrackingCompanyName'];
    operationPlansModel.name = json['name'];
    operationPlansModel.englishName = json['englishName'];
    operationPlansModel.crLicenseId = json['crLicenseId'];
    operationPlansModel.applicationId = json['applicationId'];
    operationPlansModel.vehicleId = json['vehicleId'];
    operationPlansModel.manPowerId = json['manPowerId'];
    operationPlansModel.finalDestinationId = json['finalDestinationId'];
    operationPlansModel.operationPlanClassificationTypeId =
    json['operationPlanClassificationTypeId'];
    operationPlansModel.fromDate = json['fromDate'];
    operationPlansModel.vehicleInfo = json['vehicleInfo'];
    operationPlansModel.fromDateFormatted = json['fromDateFormatted'];
    operationPlansModel.toDate = json['toDate'];
    operationPlansModel.toDateFormatted = json['toDateFormatted'];
    operationPlansModel.fromTime = json['fromTime'];
    operationPlansModel.toTime = json['toTime'];
    operationPlansModel.requiredDays = json['requiredDays'];
    operationPlansModel.licenseNumber = json['licenseNumber'];
    operationPlansModel.vehicleBrand = json['vehicleBrand'];
    operationPlansModel.manPowerName = json['manPowerName'];
    operationPlansModel.avlCompanyName = json['avlCompanyName'];
    operationPlansModel.wasteTypeName = json['wasteTypeName'];
    operationPlansModel.wasteTypeCode = json['wasteTypeCode'];
    operationPlansModel.municipalityName = json['municipalityName'];
    operationPlansModel.municipalityId = json['municipalityId'];
    operationPlansModel.subMunicipalityName = json['subMunicipalityName'];
    operationPlansModel.finalDestinationName = json['finalDestinationName'];
    operationPlansModel.createdById = json['createdById'];
    operationPlansModel.createdOn = json['createdOn'];
    operationPlansModel.isActive = json['isActive'];

    operationPlansModel.finalDestinationLatitude =
        Converter.convertToDouble(json['finalDestinationLatitude']);
    operationPlansModel.finalDestinationLongitude =
        Converter.convertToDouble(json['finalDestinationLongitude']);
    operationPlansModel.code = json['code'];

    return operationPlansModel;
  }
}
