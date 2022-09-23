import 'package:fix_ms/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FixMSApp());
}

class FixMSApp extends StatelessWidget {
  const FixMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fixMS',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFFDA121A)),
        primaryColor: const Color(0xFFDA121A),
        backgroundColor: const Color(0xFFFCDD09),
        scaffoldBackgroundColor: const Color(0xFFFCDD09),
      ),
      initialRoute: Routes.onboarding,
      onGenerateRoute: (settings) {
        final builder = Routes.getRoutesMap()[settings.name];
        if (builder == null) {
          return null;
        } // Or some error page? Shouldn't happen anyway - this is basically 404
        return buildRoute(builder(), settings);
      },
    );
  }

  PageRouteBuilder buildRoute(Widget target, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) =>
      target,
      transitionDuration: const Duration(milliseconds: 0),
      reverseTransitionDuration: const Duration(milliseconds: 0),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
