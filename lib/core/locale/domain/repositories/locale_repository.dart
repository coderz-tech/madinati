import '../../../network/api_response.dart';
import '../entities/dictionary_entity.dart';

abstract class LocaleRepository {
  Future saveLocale({required String code});

  Future<String> loadSavedLocale();

  Future<ApiResponse<DictionaryEntity>> getDictionary();
}
