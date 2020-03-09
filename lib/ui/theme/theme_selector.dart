import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme/ui/theme/ColorPalette.dart';
import 'package:theme/ui/theme/brightnessSwitch.dart';

class ThemeSelector extends StatefulWidget {
  @override
  _ThemeSelectorState createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  int get x => 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select theme'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesomeIcons.palette),
      ),
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: BrightnessSwitch(),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(8.0), child: Divider(height: 0)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'primary colors',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ColorPalette(),
        ],
      ),
    );
  }
}
