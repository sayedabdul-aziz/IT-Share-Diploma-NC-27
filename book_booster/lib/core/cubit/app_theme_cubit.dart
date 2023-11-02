import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  bool isDark = false;

  void changeMode(bool toggle) {
    isDark = toggle;
    emit(UpdateThemeState());
  }
}
