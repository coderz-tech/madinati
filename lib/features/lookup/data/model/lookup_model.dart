import 'package:madinati/features/lookup/domain/entity/lookup_entity.dart';
class LookupModel extends LookupEntity {
  LookupModel({
    super.text,
    super.value,
    super.isSelected = false,
    super.isCurrent = false,
  });

  factory LookupModel.fromJson({required Map<dynamic, dynamic> json}) {
    return LookupModel(
      value: json['value'],
      text: json['text'],
      isSelected: false,
      isCurrent: false,
    );
  }
}
