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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.home);
                },
                child: const Text(
                  'Überspringen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: SafeArea(
            child: Container(
                constraints: const BoxConstraints.expand(width: 500),
                child: FutureBuilder(
                  future: loadStateFuture,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
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
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 20.0),
                                decoration: const InputDecoration(
                                    label: Text('Vorname'),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(100, 255, 251, 194)),
                                initialValue: savedSettings.firstName ?? '',
                                onSaved: (val) {
                                  if (val != null && val.isEmpty) {
                                    val = null;
                                  }
                                  changedSettings.firstName = val;
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 20.0),
                                decoration: const InputDecoration(
                                    label: Text('Nachname'),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(100, 255, 251, 194)),
                                initialValue: savedSettings.lastName ?? '',
                                onSaved: (val) {
                                  if (val != null && val.isEmpty) {
                                    val = null;
                                  }
                                  changedSettings.lastName = val;
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 20.0),
                                decoration: const InputDecoration(
                                    label: Text('E-Mail Adresse'),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(100, 255, 251, 194)),
                                initialValue: savedSettings.email ?? '',
                                onSaved: (val) {
                                  if (val != null && val.isEmpty) {
                                    val = null;
                                  }
                                  changedSettings.email = val;
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 20.0),
                                decoration: const InputDecoration(
                                    label: Text('Telefonnummer'),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(100, 255, 251, 194)),
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
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(100, 60)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    storageService
                                        .saveSettings(changedSettings);
                                    Navigator.of(context)
                                        .pushNamed(Routes.home);
                                  }
                                },
                                child: const Text(
                                  'Speichern',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ),
        ));
  }
}
