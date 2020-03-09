import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme/model/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState(
        themeModel: ThemeModel(
          brightness: Brightness.light,
          color: Colors.primaries[0],
        ),
      );

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ChangeThemeColor) {
      yield ThemeState(
        themeModel: ThemeModel(
            brightness: state.themeModel.brightness, color: event.color),
      );
    }
    if (event is ChangeThemeBrightness) {
      yield ThemeState(
        themeModel: ThemeModel(
          brightness: event.isDark ? Brightness.dark : Brightness.light,
          color: state.themeModel.color,
        ),
      );
    }
  }

  @override
  void onTransition(Transition<ThemeEvent, ThemeState> transition) {
    print(transition);
  }
}
