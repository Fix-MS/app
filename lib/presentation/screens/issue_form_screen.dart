import 'package:fix_ms/routes.dart';
import 'package:flutter/material.dart';

class IssueFormScreen extends StatefulWidget {

  const IssueFormScreen({super.key});

  @override
  State<IssueFormScreen> createState() => IssueFormScreenState();
}

class IssueFormScreenState extends State<IssueFormScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hier ist die Form',
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.home);
                },
                child: const Text(
                  'Open Home',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.form);
                },
                child: const Text(
                  'Open Form',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.settings);
                },
                child: const Text(
                  'Open Settings',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
