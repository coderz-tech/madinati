import '../repositories/theme_repository.dart';

class SetIsDarkTheme {
  final ThemeRepository repository;

  SetIsDarkTheme({required this.repository});

  call({required bool isDarkTheme}) {
    return repository.setIsDarkTheme(isDarkTheme: isDarkTheme);
  }
}
