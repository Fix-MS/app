import 'package:flutter/material.dart';

class FixMSAppBar extends AppBar {
  FixMSAppBar({
    super.key,
    required String title,
    super.actions,
    super.automaticallyImplyLeading,
  }) : super(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              ),
            ],
          ),
        );
}
