import 'package:event_app/home/home_screen.dart';
import 'package:event_app/onBoarding/on_boarding_screen.dart';
import 'package:event_app/providers/app_language_provider.dart';
import 'package:event_app/providers/app_theme_provider.dart';
import 'package:event_app/utils/app_routes.dart';
import 'package:event_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool showOnBoarding =prefs.getBool('onBoarding') ?? true;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
      ChangeNotifierProvider(create: (context) => AppThemeProvider(),)
    ],
      child:  MyApp(showOnBoarding: showOnBoarding )));
}

class MyApp extends StatelessWidget {
  final bool showOnBoarding;
  const MyApp({super.key, required this.showOnBoarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: showOnBoarding
      ?AppRoutes.onBoardingScreen
      :AppRoutes.homeRouteName,
      routes: {
        AppRoutes.onBoardingScreen:(context)=>OnBoardingScreen(),
        AppRoutes.homeRouteName:(context)=> HomeScreen(),
      },
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );

  }
}
