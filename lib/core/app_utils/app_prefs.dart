// ignore_for_file: unused_field

import 'dart:convert';

import 'package:task/features/auth/domain/model/user_data_login_model.dart';




import 'app_constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/../core/app_utils/app_theme.dart';
import 'app_strings.dart';

@injectable
class AppPreferences {
  //pref for Local Api
//=========================================================================//

  static const String _deviceType = '_deviceType';


//=========================================================================//
  static const String _isDarkMode = 'isDarkMode';
  static const String _lang = 'lang';
  final String _isLogin = 'isLogin';
  final String _token = 'token';

  final String _userInfoDM = 'UserLoginDataDM';
  final String _password = 'password';
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<bool> _putData(String key, dynamic value) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    return await _sharedPreferences.setBool(key, value);
  }

  dynamic _getData(String key, dynamic def) {
    var value = _sharedPreferences.get(key);
    return value ?? def;
  }

  Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }

//app language
  set appLanguage(String language) {
    _putData(_lang, language);
  }

  String get appLanguage => _getData(_lang, AppStrings.arLanguage);




  //device type
  set isAdmin(bool type) {
    _putData(_deviceType, type);
  }

  bool get isAdmin {
    var device = _getData(_deviceType, true);
    if (device == true) {
      return true;
    } else {
      return false;
    }
  }

//app ThemeData
  ThemeData? get getTheme {
    final bool isDark = _getData(_isDarkMode, false);
    ThemeData? theme;
    if (isDark) {
      theme = appThemeData[AppTheme.darkAppTheme];
    } else {
      theme = appThemeData[AppTheme.lightAppTheme];
    }
    return theme;
  }

  set appTheme(bool isDart) {
    _putData(_isDarkMode, isDart);
  }


//token
  String get token => _getData(_token, '');

  set token(String value) {
    _putData(_token, value);
  }

//password
  String get password => _getData(_password, '');

  set password(String value) {
    _putData(_password, value);
  }

//is user login
  bool get isUserLogin => _getData(_isLogin, false);

  set isUserLogin(bool value) {
    _putData(_isLogin, value);
  }



  //user info model

  set userDataInfo(UserLoginDataDM? user) {
    _putData(_userInfoDM, jsonEncode(user));
  }

  UserLoginDataDM? get userDataInfo {
    String data = _getData(_userInfoDM, "");

    if (data.isEmpty || data == 'null') return null;
    return UserLoginDataDM.fromJson(jsonDecode(_getData(_userInfoDM, null)));
  }
}
