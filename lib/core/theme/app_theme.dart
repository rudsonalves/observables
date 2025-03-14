import 'package:flutter/widgets.dart';

class ThemeController extends ValueNotifier<bool> {
  ThemeController() : super(false);

  bool get isDark => value;

  void toggleTheme() {
    value = !value;
  }
}
