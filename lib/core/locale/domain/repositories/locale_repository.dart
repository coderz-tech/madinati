abstract class LocaleRepository {
  Future saveLocale({required String code});

  Future<String> loadSavedLocale();
}
