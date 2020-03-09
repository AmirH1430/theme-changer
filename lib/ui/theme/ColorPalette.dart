import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bloc/theme_bloc.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final MaterialColor color = Colors.primaries[index];
                final statecolor = state.themeModel.color;
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100),
                        color: color,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            if (color != statecolor) {
                              BlocProvider.of<ThemeBloc>(context)
                                  .add(ChangeThemeColor(color: color));
                            }
                          },
                        ),
                      ),
                      statecolor == color
                          ? Icon(
                              FontAwesomeIcons.check,
                              color: Colors.grey[300],
                              size: 20,
                            )
                          : Container()
                    ],
                  ),
                );
              },
              childCount: Colors.primaries.length,
            ),
          ),
        );
      },
    );
  }
}
