import 'dart:io';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import '../../../constants/app_constants.dart';
import '../../../utils/secure_storage_helper.dart';
import '../../domain/entities/local_model.dart';
import '../../domain/repositories/locale_repository.dart';

class LocaleCubit extends Cubit<List<LocalModel>> {
  final LocaleRepository localeRepository;

  List<LocalModel> listLocalModel = [
    LocalModel(
      code: "en",
      name: "English",
      locale: const Locale("en"),
      isSelected: true,
      isCurrent: true,
    ),
    LocalModel(
      code: "ar",
      name: "العربية",
      locale: const Locale("ar"),
      isSelected: false,
      isCurrent: false,
    ),
    LocalModel(
      code: "ur",
      name: "اوردو",
      locale: const Locale("ur"),
      isSelected: false,
      isCurrent: false,
    ),
    LocalModel(
      code: "hi",
      name: "हिन्दी",
      locale: const Locale("hi"),
      isSelected: false,
      isCurrent: false,
    ),
  ];

  LocaleCubit({required this.localeRepository})
      : super([
          LocalModel(
            code: "en",
            name: "English",
            locale: const Locale("en"),
            isSelected: true,
            isCurrent: true,
          ),
          LocalModel(
            code: "ar",
            name: "العربية",
            locale: const Locale("ar"),
            isSelected: false,
            isCurrent: false,
          ),
          LocalModel(
            code: "ur",
            name: "اوردو",
            locale: const Locale("ur"),
            isSelected: false,
            isCurrent: false,
          ),
          LocalModel(
            code: "hi",
            name: "हिन्दी",
            locale: const Locale("hi"),
            isSelected: false,
            isCurrent: false,
          ),
        ]);

  changeSelected({required int selectedIndex}) {
    for (LocalModel localModel in listLocalModel) {
      localModel.isSelected = false;
    }
    listLocalModel[selectedIndex].isSelected = true;
    emit(List.from(listLocalModel));
  }

  Future saveLocale() async {
    await localeRepository.saveLocale(
      code: listLocalModel.firstWhere((element) => element.isSelected).code,
    );
    for (LocalModel localModel in listLocalModel) {
      localModel.isCurrent = false;
    }
    listLocalModel.firstWhere((element) => element.isSelected).isCurrent = true;

    emit(List.from(listLocalModel));
  }

  loadSavedLocale() async {
    String savedLanguageCode = await localeRepository.loadSavedLocale();
    for (LocalModel localModel in listLocalModel) {
      localModel.isSelected = false;
      localModel.isCurrent = false;
    }

    listLocalModel
        .firstWhere((element) => element.code == savedLanguageCode)
        .isCurrent = true;

    listLocalModel
        .firstWhere((element) => element.code == savedLanguageCode)
        .isSelected = true;

    emit(List.from(listLocalModel));
  }

  resetSelectedLocale() async {
    String savedLanguageCode = await localeRepository.loadSavedLocale();
    for (LocalModel localModel in listLocalModel) {
      localModel.isSelected = false;
      localModel.isCurrent = false;
    }

    listLocalModel
        .firstWhere((element) => element.code == savedLanguageCode)
        .isCurrent = true;

    listLocalModel
        .firstWhere((element) => element.code == savedLanguageCode)
        .isSelected = true;
  }

  static Future<String> getLangSharedPrefForApi() async {
    String langCode = await SecureStorageHelper().getPrefString(
      key: AppConstants.LANGUAGE_CODE,
      defaultValue: Platform.localeName.split('_').first,
    );
    if (langCode == "ar") {
      return "ar";
    } else {
      return "en";
    }
  }

  static Future<LocaleType> getLangLocalType() async {
    String langCode = await SecureStorageHelper().getPrefString(
      key: AppConstants.LANGUAGE_CODE,
      defaultValue: Platform.localeName.split('_').first,
    );

    if (langCode == "ar") {
      return LocaleType.ar;
    } else {
      return LocaleType.en;
    }
  }
}
