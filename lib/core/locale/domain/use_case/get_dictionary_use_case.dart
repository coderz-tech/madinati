import '../../../network/api_response.dart';
import '../entities/dictionary_entity.dart';
import '../repositories/locale_repository.dart';

class GetDictionaryUseCase {
  LocaleRepository localeRepository;

  GetDictionaryUseCase({required this.localeRepository});

  Future<ApiResponse<DictionaryEntity>> call() async {
    return await localeRepository.getDictionary();
  }
}
