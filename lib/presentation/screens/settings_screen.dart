import 'package:fix_ms/models/saved_settings.dart';
import 'package:fix_ms/presentation/widgets/disable_scroll_animation.dart';
import 'package:fix_ms/presentation/widgets/fix_ms_app_bar.dart';
import 'package:fix_ms/routes.dart';
import 'package:fix_ms/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late final SavedSettings savedSettings;
  late final SavedSettings changedSettings;
  late final StorageService storageService;
  late final Future<bool> loadStateFuture;

  @override
  void initState() {
    super.initState();
    loadStateFuture = () async {
      storageService = GetIt.I.get<StorageService>();
      savedSettings = await storageService.loadSettings();
      changedSettings = savedSettings.copy();
      return true;
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixMSAppBar(
        title: 'Einstellungen',
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: loadStateFuture,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Unknown error while loading state',
                ),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DisableScrollAnimation(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Um zukünftige Meldungen schneller zu machen, kannst Du hier einige Daten vorausfüllen',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Vorname'),
                        ),
                        initialValue: savedSettings.firstName ?? '',
                        onSaved: (val) {
                          if (val != null && val.isEmpty) {
                            val = null;
                          }
                          changedSettings.firstName = val;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Nachname'),
                        ),
                        initialValue: savedSettings.lastName ?? '',
                        onSaved: (val) {
                          if (val != null && val.isEmpty) {
                            val = null;
                          }
                          changedSettings.lastName = val;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('E-Mail Adresse'),
                        ),
                        initialValue: savedSettings.email ?? '',
                        onSaved: (val) {
                          if (val != null && val.isEmpty) {
                            val = null;
                          }
                          changedSettings.email = val;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Telefonnummer'),
                        ),
                        initialValue: savedSettings.phoneNumber ?? '',
                        onSaved: (val) {
                          if (val != null && val.isEmpty) {
                            val = null;
                          }
                          changedSettings.phoneNumber = val;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            storageService.saveSettings(changedSettings);
                            Navigator.of(context).pushNamed(Routes.home);
                          }
                        },
                        child: const Text(
                          'Speichern',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
