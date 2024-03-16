import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
