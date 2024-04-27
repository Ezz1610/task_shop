part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class ChangeLanguage extends AppState {
  final Locale locale;
  final bool isArSelected;
  ChangeLanguage(this.locale, this.isArSelected);
}

class ChangeTheme extends AppState {}
