import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
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

class AppConstants {
  static const String publicRawgIoApiKey = '5697c2a176a84803867e7bd2eb9aed59';
  static const String publicNewsApiKey =
      '9c26dd98e6367043e0241737fbea20cac50725fc';
  static const int pageSize = 20;
  static const Map<int, String> emojiPack = {
    1: 'skip.png',
    3: 'meh.png',
    4: 'recommended.png',
    5: 'exceptional.png',
  };

  static Map<int, String> ratingNamePack = {
    1: LocaleKeys.game_view_ratings_skip.tr(),
    3: LocaleKeys.game_view_ratings_meh.tr(),
    4: LocaleKeys.game_view_ratings_recommended.tr(),
    5: LocaleKeys.game_view_ratings_exceptional.tr(),
  };
}

class ApiConstants {
  static const String baseRawgIoUrl = 'https://api.rawg.io/api/';
  static const String baseNewsUrl = 'https://www.gamespot.com/api/';
}
