import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_keeper/core/translations/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DemoScreenConstants {
  final List<String> titles = [
    LocaleKeys.auth_demo_title_first.tr(),
    LocaleKeys.auth_demo_title_second.tr(),
    LocaleKeys.auth_demo_title_third.tr(),
  ];

  final List<String> subtitles = [
    LocaleKeys.auth_demo_subtitle_first.tr(),
    LocaleKeys.auth_demo_subtitle_second.tr(),
    LocaleKeys.auth_demo_subtitle_third.tr(),
  ];

  final List<String> buttonText = [
    LocaleKeys.common_buttons_next.tr(),
    LocaleKeys.common_buttons_next.tr(),
    LocaleKeys.common_buttons_start.tr(),
  ];

  final List<String> images = [
    'assets/images/demo1.png',
    'assets/images/demo2.png',
    'assets/images/demo3.png',
  ];

  final List<Color> backgroundColors = [
    const Color(0xFF5CC8FF),
    const Color(0xFFFEFCAD),
    const Color(0xFFFF90BC),
  ];
}

@lazySingleton
class Validators {
  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.common_errors_required.tr();
    }
    return null;
  }

  String? emailRegexValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.common_errors_required.tr();
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return LocaleKeys.common_errors_email.tr();
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.common_errors_required.tr();
    }
    if (value.length < 6) {
      return LocaleKeys.common_errors_password.tr();
    }
    return null;
  }

  String? confirmPasswordValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.common_errors_required.tr();
    }
    if (value != password) {
      return LocaleKeys.common_errors_confirm_password.tr();
    }
    return null;
  }
}

class SharedPrefsConstants {
  static const String hasSeenDemo = 'hasSeenDemo';
}

class LoginMethods {
  static const List<IconData> loginIcons = [
    FontAwesomeIcons.google,
    FontAwesomeIcons.facebookF,
    FontAwesomeIcons.github,
    FontAwesomeIcons.microsoft,
    FontAwesomeIcons.xTwitter,
  ];
}
