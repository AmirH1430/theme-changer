import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme/ui/theme/bloc/theme_bloc.dart';

class BrightnessSwitch extends StatelessWidget {
  const BrightnessSwitch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        var brightness = state.themeModel.brightness;
        bool value = brightness == Brightness.dark ? true : false;
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return ListTile(
              title: Text('dark theme'),
              leading: Icon(FontAwesomeIcons.moon),
              trailing: Switch(
                value: value ? true : false,
                onChanged: (_value) {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ChangeThemeBrightness(isDark: _value));
                },
              ),
              onTap: () {
                BlocProvider.of<ThemeBloc>(context)
                    .add(ChangeThemeBrightness(isDark: !value));
              },
            );
          },
        );
      },
    );
  }
}
