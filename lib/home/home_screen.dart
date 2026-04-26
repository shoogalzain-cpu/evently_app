import 'package:event_app/home/tabs/profile/profile.dart';
import 'package:event_app/l10n/app_localizations.dart';
import 'package:event_app/utils/app_colors.dart';
import 'package:flutter/material.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileTab(),
    );
  }
}
