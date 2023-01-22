import 'package:flutter/material.dart';

class FixMsScaffold extends StatelessWidget {
  final Widget body;
  final double maxWidth;
  final AppBar? appBar;
  final FloatingActionButton? floatingActionButton;

  static const double defaultMaxWidth = 600;

  const FixMsScaffold({
    super.key,
    required this.body,
    this.maxWidth = double.infinity,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
