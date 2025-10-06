import 'dart:io';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import '../../../constants/app_constants.dart';
import '../../../utils/secure_storage_helper.dart';
import '../../domain/entities/dictionary_entity.dart';
import '../../domain/entities/local_entity.dart';
import '../../domain/repositories/locale_repository.dart';
import 'package:collection/collection.dart';
import '../../domain/use_case/get_dictionary_use_case.dart';
import '../state/locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final LocaleRepository localeRepository;
  List<DictionaryEntity> listDictionaryEntity = [];
  final GetDictionaryUseCase getDictionaryUseCase;

  List<LocalEntity> listLocalEntity = [
    LocalEntity(
      code: "en",
      name: "English",
      locale: const Locale("en"),
      isSelected: true,
      isCurrent: true,
    ),
    LocalEntity(
      code: "ar",
      name: "العربية",
      locale: const Locale("ar"),
      isSelected: false,
      isCurrent: false,
    ),
    LocalEntity(
      code: "ur",
      name: "اوردو",
      locale: const Locale("ur"),
      isSelected: false,
      isCurrent: false,
    ),
    LocalEntity(
      code: "hi",
      name: "हिन्दी",
      locale: const Locale("hi"),
      isSelected: false,
      isCurrent: false,
    ),
  ];

  LocaleCubit({
    required this.localeRepository,
    required this.getDictionaryUseCase,
  }) : super(
    LocaleInitialState(
      listLocal: [
        LocalEntity(
          code: "en",
          name: "English",
          locale: const Locale("en"),
          isSelected: true,
          isCurrent: true,
        ),
        LocalEntity(
          code: "ar",
          name: "العربية",
          locale: const Locale("ar"),
          isSelected: false,
          isCurrent: false,
        ),
        LocalEntity(
          code: "ur",
          name: "اوردو",
          locale: const Locale("ur"),
          isSelected: false,
          isCurrent: false,
        ),
        LocalEntity(
          code: "hi",
          name: "हिन्दी",
          locale: const Locale("hi"),
          isSelected: false,
          isCurrent: false,
        ),
      ],
    ),
  );


  changeSelected({required int selectedIndex}) {
    emit(LocaleLoadingState(listLocal: List.from(listLocalEntity)));
    for (LocalEntity localModel in listLocalEntity) {
      localModel.isSelected = false;
    }
    listLocalEntity[selectedIndex].isSelected = true;
    emit(LocaleLoadedState(listLocal: List.from(listLocalEntity)));
  }

  Future saveLocale() async {
    emit(LocaleLoadingState(listLocal: List.from(listLocalEntity)));
    await localeRepository.saveLocale(
      code: listLocalEntity.firstWhere((element) => element.isSelected).code,
    );
    for (LocalEntity localModel in listLocalEntity) {
      localModel.isCurrent = false;
    }
    listLocalEntity.firstWhere((element) => element.isSelected).isCurrent =
    true;

    emit(LocaleLoadedState(listLocal: List.from(listLocalEntity)));
  }

  loadSavedLocale() async {
    emit(LocaleLoadingState(listLocal: List.from(listLocalEntity)));
    String savedLanguageCode = await localeRepository.loadSavedLocale();
    for (LocalEntity localModel in listLocalEntity) {
      localModel.isSelected = false;
      localModel.isCurrent = false;
    }

    listLocalEntity
        .firstWhere((element) => element.code == savedLanguageCode)
        .isCurrent =
    true;

    listLocalEntity
        .firstWhere((element) => element.code == savedLanguageCode)
        .isSelected =
    true;

    emit(LocaleLoadedState(listLocal: List.from(listLocalEntity)));
  }


  String get currentLocaleCode {
    return listLocalEntity.firstWhere((element) => element.isCurrent).code;
  }
  resetSelectedLocale() async {
    String savedLanguageCode = await localeRepository.loadSavedLocale();
    for (LocalEntity localModel in listLocalEntity) {
      localModel.isSelected = false;
      localModel.isCurrent = false;
    }

    listLocalEntity
        .firstWhere((element) => element.code == savedLanguageCode)
        .isCurrent = true;

    listLocalEntity
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

  Future fetchDictionary() async {
    emit(LocaleLoadingState(listLocal: List.from(listLocalEntity)));
    await getDictionaryUseCase.call().then(
          (value) {
        listDictionaryEntity = value.dataList ?? [];
        emit(LocaleLoadedState(listLocal: List.from(listLocalEntity)));
      },
      onError: (error) {
        listDictionaryEntity = [];
        emit(LocaleErrorState(listLocal: List.from(listLocalEntity)));
      },
    );
  }

  String getLabelById({required int id}) {
    return listDictionaryEntity
            .firstWhereOrNull(
              (element) =>
                  element.id == id &&
                  element.languageID ==
                      listLocalEntity
                          .firstWhereOrNull((element) => element.isCurrent)
                          ?.code,
            )
            ?.description ??
        "-";
  }

  String get currentLocaleName {
    return listLocalEntity.firstWhere((element) => element.isCurrent).name;
  }

}
