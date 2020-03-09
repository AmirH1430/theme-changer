import 'package:flutter/material.dart';

class ThemeModel {
  final Brightness brightness;
  final MaterialColor color;

  ThemeModel({@required this.brightness, @required this.color})
      : assert(color != null && brightness != null);
}
