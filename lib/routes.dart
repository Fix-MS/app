import 'package:fix_ms/presentation/screens/home_screen.dart';
import 'package:fix_ms/presentation/screens/issue_form_screen.dart';
import 'package:fix_ms/presentation/screens/onboarding_screen.dart';
import 'package:fix_ms/presentation/screens/settings_screen.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const form = '/form';
  static const home = '/home';
  static const settings = '/settings';
  static const onboarding = '/onboarding';

  static Map<String, Widget Function()> getRoutesMap() => {
    form: () => const IssueFormScreen(),
    home: () => const HomeScreen(),
    settings: () => const SettingsScreen(),
    onboarding: () => const OnboardingScreen(),
  };
}