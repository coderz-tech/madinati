import '../../domain/entities/dictionary_entity.dart';

class DictionaryModel extends DictionaryEntity {
  DictionaryModel({
    required super.id,
    required super.languageID,
    required super.description,
  });

  factory DictionaryModel.fromJson({required Map<String, dynamic> json}) {
    return DictionaryModel(
      id: json['id'],
      languageID: json['languageID'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'languageID': languageID, 'description': description};
  }
}
