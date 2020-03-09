part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeThemeBrightness extends ThemeEvent {
  final bool isDark;

  ChangeThemeBrightness({@required this.isDark}) : assert(isDark != null);
  @override
  List<Object> get props => [isDark];
}

class ChangeThemeColor extends ThemeEvent {
  final Color color;

  ChangeThemeColor({@required this.color}) : assert(color != null);
  @override
  List<Object> get props => [color];
}
