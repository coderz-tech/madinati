
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/sheet_state.dart';

class SheetCubit extends Cubit<SheetState> {
  SheetCubit() : super(SheetClosed());

  void openSheet() => emit(SheetOpened());

  void closeSheet() => emit(SheetClosed());
}