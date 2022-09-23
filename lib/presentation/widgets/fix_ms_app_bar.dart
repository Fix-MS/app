import 'package:flutter/material.dart';

class FixMSAppBar extends AppBar {

  FixMSAppBar({
    super.key,
    required String title,
    super.actions,
  }) : super(
    title: Text(title),
  );
}