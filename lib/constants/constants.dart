import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = 'Pokedex';
  static TextStyle getTitleStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(40));
  }

  static TextStyle getPokiTextStyle() {
    return const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 31);
  }

  static TextStyle getTypeChipTextStyle() {
    return const TextStyle(color: Colors.white, fontSize: 20);
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.6).sp;
    }
  }

  static getPokiInfoTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(30),
        color: Colors.black,
        fontWeight: FontWeight.bold);
  }

  static getPokiInfoLabelTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(30), color: Colors.black);
  }
}
