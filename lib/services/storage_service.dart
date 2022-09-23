import 'package:fix_ms/models/saved_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<SavedSettings> loadSettings() async {
    final firstName = prefs.getString('settings.firstName');
    final lastName = prefs.getString('settings.lastName');
    final email = prefs.getString('settings.email');
    final phoneNumber = prefs.getString('settings.phoneNumber');

    return SavedSettings(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
    );
  }

  Future<void> saveSettings(SavedSettings settings) async {
    if (settings.firstName != null) {
      await prefs.setString('settings.firstName', settings.firstName!);
    } else {
      await prefs.remove('settings.firstName');
    }
    if (settings.lastName != null) {
      await prefs.setString('settings.lastName', settings.lastName!);
    } else {
      await prefs.remove('settings.lastName');
    }
    if (settings.email != null) {
      await prefs.setString('settings.email', settings.email!);
    } else {
      await prefs.remove('settings.email');
    }
    if (settings.phoneNumber != null) {
      await prefs.setString('settings.phoneNumber', settings.phoneNumber!);
    } else {
      await prefs.remove('settings.phoneNumber');
    }
  }
}