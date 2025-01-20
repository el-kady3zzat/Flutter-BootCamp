import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void setLightTheme(BuildContext context) {
    AdaptiveTheme.of(context).setLight();
    emit(LightThemeState());
  }

  void setDarkTheme(BuildContext context) {
    AdaptiveTheme.of(context).setDark();
    emit(DarkThemeState());
  }
}
