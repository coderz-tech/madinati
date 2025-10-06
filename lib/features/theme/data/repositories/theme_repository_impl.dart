import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_local_data_source.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> getIsDarkTheme() async {
    return await localDataSource.getIsDarkTheme();
  }

  @override
  setIsDarkTheme({required bool isDarkTheme}) {
    localDataSource.setIsDarkTheme(isDarkTheme: isDarkTheme);
  }
}
