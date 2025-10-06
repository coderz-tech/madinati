import '../../domain/entities/dictionary_entity.dart';
import '../../domain/entities/local_entity.dart';

abstract class LocaleState {
  List<LocalEntity> listLocal;

  LocaleState({required this.listLocal});
}

class LocaleInitialState extends LocaleState {
  LocaleInitialState({required super.listLocal});
}

class LocaleLoadingState extends LocaleState {
  LocaleLoadingState({required super.listLocal});
}

class LocaleLoadedState extends LocaleState {
  LocaleLoadedState({required super.listLocal});
}

class LocaleErrorState extends LocaleState {
  LocaleErrorState({required super.listLocal});
}
