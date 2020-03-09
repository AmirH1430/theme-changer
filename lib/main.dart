import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/ui/homepage/homepage.dart';
import 'package:theme/ui/theme/bloc/theme_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          var brightness = state.themeModel.brightness;
          MaterialColor color = state.themeModel.color;
          return MaterialApp(
            theme: ThemeData(
              brightness: brightness,
              primaryColor: color,
              primaryColorDark: color[400],
              accentColor: color,
              toggleableActiveColor: color,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Theme App',
            home: HomePage(),
          );
        },
      ),
    );
  }
}
