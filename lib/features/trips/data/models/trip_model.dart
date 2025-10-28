import 'package:madinati/features/trips/data/models/trip_final_destination_model.dart';
import 'package:madinati/features/trips/domain/entity/trip_entity.dart';
import '../../../../core/utils/converter.dart';

class DriverTripModel extends TripEntity {
  DriverTripModel({
    super.code,
    super.vehicleBrand,
    super.tripDay,
    super.startPointBitmapDescriptor,
    super.endPointBitmapDescriptor,
    super.actualStartDate,
    super.avlTrackingCompanyName,
    super.completetionPercentage,
    super.driverName,
    super.manualCompletionToleranceInMeters,
    super.delayTime,
    super.finalDestiantionPoints,
    super.finalDestiantionLocation,
    super.finalDestinationCode,
    super.finalDestinationName,
    super.isLoaded,
    super.operationPlanType,
    super.manPowerCode,
    super.planCode,
    super.regularityPercentage,
    super.tripDate,
    super.startingPointLongitude,
    super.startingPointLatitude,
    super.startingPointName,
    super.tripEndTime,
    super.tripName,
    super.tripStartTime,
    super.vehicleCode,
    super.vehicleInfo,
    super.wasteType,
    super.actualStartTime,
  });

  factory DriverTripModel.fromJson({required Map<String, dynamic> json}) {
    DriverTripModel tripModel = DriverTripModel();
    tripModel.code = json['code'];
    tripModel.planCode = json['planCode'];
    tripModel.tripDate = json['tripDate'];
    tripModel.tripDay = json['tripDay'];
    tripModel.tripName = json['tripName'];
    tripModel.vehicleBrand = json['vehicleBrand'];
    tripModel.wasteType = json['wasteType'];
    tripModel.avlTrackingCompanyName = json['avlTrackingCompanyName'];
    tripModel.vehicleInfo = json['vehicleInfo'];
    tripModel.vehicleCode = json['vehicleCode'];
    tripModel.driverName = json['driverName'];
    tripModel.manPowerCode = json['manPowerCode'];
    tripModel.finalDestinationName = json['finalDestinationName'];
    tripModel.finalDestinationCode = json['finalDestinationCode'];
    tripModel.finalDestiantionLocation = json['finalDestiantionLocation'];
    tripModel.regularityPercentage = json['regularityPercentage'];
    tripModel.completetionPercentage = json['completetionPercentage'];
    tripModel.tripStartTime = json['tripStartTime'];
    tripModel.tripEndTime = json['tripEndTime'];
    tripModel.actualStartDate = json['actualStartDate'];
    tripModel.actualStartTime = json['actualStartTime'];
    tripModel.delayTime = json['delayTime'];
    tripModel.isLoaded = json['isLoaded'];
    tripModel.operationPlanType = json['operationPlanType'];
    tripModel.startingPointName = json['startingPointName'];
    tripModel.manualCompletionToleranceInMeters =
        Converter.convertToDouble(json['manualCompletionToleranceInMeters']);
    tripModel.startingPointLongitude =
        Converter.convertToDouble(json['startingPointLongitude']);
    tripModel.startingPointLatitude =
        Converter.convertToDouble(json['startingPointLatitude']);
    if (json['finalDestiantionPoints'] != null) {
      tripModel.finalDestiantionPoints = <TripFinalDestinationModel>[];
      json['finalDestiantionPoints'].forEach((v) {
        tripModel.finalDestiantionPoints!
            .add(TripFinalDestinationModel.fromJson(json: v));
      });
    }
    return tripModel;
  }
}
