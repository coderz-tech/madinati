import '../repositories/theme_repository.dart';

class GetIsDarkTheme {
  final ThemeRepository repository;

  GetIsDarkTheme({required this.repository});

  Future<bool> call() async {
    return await repository.getIsDarkTheme();
  }
}
