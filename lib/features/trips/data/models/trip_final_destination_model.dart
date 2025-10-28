import '../../../../core/utils/converter.dart';
import '../../domain/entity/trip_final_destination_entity.dart';

class TripFinalDestinationModel extends TripFinalDestinationEntity {
  TripFinalDestinationModel({
    required super.latitude,
    required super.longitude,
    required super.pointOrder,
  });

  factory TripFinalDestinationModel.fromJson({
    required Map<dynamic, dynamic> json,
  }) {
    return TripFinalDestinationModel(
      latitude: Converter.convertToDouble(json['latitude']),
      pointOrder: json["pointOrder"],
      longitude: Converter.convertToDouble(json['longitude']),
    );
  }
}
