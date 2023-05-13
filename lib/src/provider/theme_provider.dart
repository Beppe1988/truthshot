import 'package:flutter/material.dart';
import 'package:librecamera/src/utils/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? _themeMode;

  ThemeMode themeMode() {
    _themeMode = Preferences.getThemeMode().isNotEmpty
        ? Themes.getThemeModeFromName(Preferences.getThemeMode())
        : ThemeMode.system;
    return _themeMode!;
  }

  void setTheme(ThemeMode theme) {
    Preferences.setThemeMode(theme.name);
    _themeMode = theme;
    notifyListeners();
  }
}

class Themes {
  ThemeData theme({required ColorScheme colorScheme}) => ThemeData(
      colorScheme: colorScheme, useMaterial3: Preferences.getUseMaterial3());

  static ThemeMode getThemeModeFromName(String themeModeName) {
    if (themeModeName == ThemeMode.system.name) {
      return ThemeMode.system;
    } else if (themeModeName == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (themeModeName == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}
