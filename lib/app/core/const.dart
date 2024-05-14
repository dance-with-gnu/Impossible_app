import 'dart:ui';

import 'package:flutter/material.dart';

// ignore_for_file: constant_identifier_names

// const String FONT_TENADA = 'Tenada';
// const String FONT_NOTOSANS = 'NotoSans';
// const String FONT_ARIRANG = 'JSarirang';

const String ACCESS_TOKEN_KEY = 'access_token_key';
const String REFRESH_TOKEN_KEY = 'refresh_token_key';

// const String URL_PREFIX = '';
const String URL_PREFIX = 'http://127.0.0.1:8010';
const String API_PREFIX = '$URL_PREFIX/api';
const String URL_UI = '$URL_PREFIX/ui/';

abstract class IMColors {
  static const grey = Color(0xffB2B2B2);
  static const grey2 = Color(0xffE8E8E8);

  static const err = Color(0xfffd5e5e);

  static const black = Color(0xff161719);
  static const darkGrey = Color(0xff121212);

  static final highWhite = const Color(0xffffffff).withOpacity(0.87);
  static final mediumWhite = const Color(0xffffffff).withOpacity(0.60);
  static final disabledWhite = const Color(0xffffffff).withOpacity(0.38);

  static const bgBlack = Color(0xff202020);
  static const bgBlack2 = Color(0xff3E3C3C);

  // Combined Blue Palette
  static const blue100 = Color(0xFFEAF7FF); // Light Blue (91C8E4) Lightest
  static const blue200 = Color(0xFFB8CFF2); // Medium Blue (5D8BCE) Very Light
  static const blue300 = Color(0xFFBFE9FF); // Light Blue (91C8E4) Lighter
  static const blue400 = Color(0xFF88AEEA); // Medium Blue (5D8BCE) Light
  static const blue500 = Color(0xFF95DBFF); // Light Blue (91C8E4) Light
  static const blue600 = Color(0xFF5D8BCE); // Medium Blue (5D8BCE) Main
  static const blue700 = Color(0xFF419DCC); // Light Blue (91C8E4) Main
  static const blue800 = Color(0xFF3175A1); // Light Blue (91C8E4) Darker
  static const blue900 = Color(0xFF225277); // Light Blue (91C8E4) Darkest
  static const blue1000 = Color(0xFF184275); // Medium Blue (5D8BCE) Darker
  static const blue1100 = Color(0xFF14314C); // Light Blue (91C8E4) Dark
  static const blue1200 = Color(0xFF102B4A); // Medium Blue (5D8BCE) Darkest
  static const blue1300 = Color(0xFF081223); // Light Blue (91C8E4) Darkest

  // Simplified Beige Palette
  static const beige100 =
      Color(0xFFFFFEFB); // Lightest Beige (F6F4EB Light Tone)
  static const beige200 = Color(0xFFF6F4EB); // Main Beige (F6F4EB)
  static const beige300 = Color(0xFFA7A596); // Darkest Beige (F6F4EB Dark Tone)

  // static const brightKey = Color(0xff9B8EDF);

  static const whiteText = Color(0xffababab);
}
