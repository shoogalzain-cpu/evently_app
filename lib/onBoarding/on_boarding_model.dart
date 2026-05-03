import 'package:event_app/l10n/app_localizations.dart';

class OnBoardingModel {
  final String lightImage;
  final String darkImage;
  final String Function(AppLocalizations) title;
  final String Function(AppLocalizations) description;

  OnBoardingModel({
    required this.lightImage,
    required this.darkImage,
    required this.title,
    required this.description,
  });
}