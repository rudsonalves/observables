import 'package:flutter/material.dart';
import 'package:observables/core/theme/app_theme.dart';
import 'package:observables/ui/home_page.dart';

final appTheme = ThemeController();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    appTheme.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: appTheme,
      builder: (context, isDark, _) {
        return MaterialApp(
          theme: isDark ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
