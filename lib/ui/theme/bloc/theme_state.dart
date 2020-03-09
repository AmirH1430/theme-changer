part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeModel themeModel;

  ThemeState({@required this.themeModel}) : assert(themeModel != null);

  @override
  List<Object> get props => [themeModel];
}
