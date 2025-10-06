import '../../../constants/api_constants.dart';
import '../../../network/api_client.dart';
import '../../../network/api_response.dart';
import '../../domain/entities/dictionary_entity.dart';
import '../models/dictionary_model.dart';

abstract class LocaleDataSource {
  Future<ApiResponse<DictionaryEntity>> getAllDictionary();
}

class LocaleDataSourceImpl extends LocaleDataSource {
  @override
  Future<ApiResponse<DictionaryEntity>> getAllDictionary() async {
    final response = await ApiClient.getDataList(
      endpoint: ApiConstants.getAllDictionary,
      fromJsonT: (data) => DictionaryModel.fromJson(json: data),
    );
    return response;
  }
}
