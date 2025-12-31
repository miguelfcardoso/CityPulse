import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'config/app_config.dart';
import 'config/app_theme.dart';
import 'services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize theme service
  final themeService = ThemeService();
  await themeService.loadThemeMode();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(CityPulseApp(themeService: themeService));
}

class CityPulseApp extends StatelessWidget {
  final ThemeService themeService;

  const CityPulseApp({
    super.key,
    required this.themeService,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeService,
      builder: (context, child) {
        return MaterialApp(
          title: AppConfig.appTitle,
          debugShowCheckedModeBanner: false,
          themeMode: themeService.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: HomeScreen(themeService: themeService),
        );
      },
    );
  }
}
