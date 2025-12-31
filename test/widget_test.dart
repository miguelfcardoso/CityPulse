// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:city_pulse/main.dart';
import 'package:city_pulse/services/theme_service.dart';

void main() {
  testWidgets('App starts and displays city name', (WidgetTester tester) async {
    // Initialize theme service for testing
    final themeService = ThemeService();
    await themeService.loadThemeMode();

    // Build our app and trigger a frame.
    await tester.pumpWidget(CityPulseApp(themeService: themeService));

    // Verify that the city name is displayed
    expect(find.text('Coimbra'), findsOneWidget);

    // Verify that the explore button exists
    expect(find.text('Explorar Categorias'), findsOneWidget);
  });
}
