import 'package:fix_ms/presentation/screens/draft_issues_screen.dart';
import 'package:fix_ms/presentation/screens/issue_form_screen.dart';
import 'package:fix_ms/presentation/screens/live_location_page.dart';
import 'package:fix_ms/presentation/screens/onboarding_screen.dart';
import 'package:fix_ms/presentation/screens/settings_screen.dart';
import 'package:fix_ms/presentation/screens/imprint_screen.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const form = '/form';
  static const home = '/home';
  static const settings = '/settings';
  static const onboarding = '/onboarding';
  static const issues = '/issues';
  static const imprint = '/imprint';

  static Map<String, Widget Function()> getRoutesMap() => {
        form: () => const IssueFormScreen(),
        home: () => const LiveLocationPage(),
        settings: () => const SettingsScreen(),
        onboarding: () => const OnboardingScreen(),
        imprint: () => const ImprintScreen(),
        issues: () => const DraftIssuesScreen(),
      };
}
