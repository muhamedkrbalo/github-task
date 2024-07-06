import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class HiveMethods {
  static final _box = Hive.box('app');

  static String getLang() {
    return _box.get('lang', defaultValue: 'ar');
  }

  static void updateLang(Locale locale) {
    _box.put('lang', locale.languageCode);
  }

  static String? getToken() {
    return _box.get('token');
  }

  static void updateToken(String token) {
    _box.put('token', token);
  }

  static void deleteToken() {
    _box.delete('token');
  }




}
