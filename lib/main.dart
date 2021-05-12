import 'package:ecopouce_screens/screens/home_screen.dart';
import 'package:ecopouce_screens/screens/login_screen.dart';
import 'package:ecopouce_screens/screens/scan_qr_screen.dart';
import 'package:ecopouce_screens/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'helpers/app_localizations.dart';

void main() {
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor ecoDarkBlue = MaterialColor(0xFF1B365D, color);
MaterialColor ecoLightBlue = MaterialColor(0xFF5C88DA, color);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EcoPouce',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: ecoDarkBlue,
            accentColor: ecoDarkBlue,
            buttonColor: ecoDarkBlue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          supportedLocales: [
            Locale('fr', 'CH'),
            Locale('de', 'CH'),
            Locale('en', 'US'),
          ],
          localizationsDelegates: [
            // A class which loads the translations from JSON files
            AppLocalizations.delegate,
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            // If the locale of the device is not supported, use the first one
            return supportedLocales.first;
          },
          // Show splash screen while waiting for app resources to load:
          home: snapshot.connectionState == ConnectionState.waiting
              ? SplashScreen()
              : LoginScreen(),

          routes: {ScanQrScreen.routeName: (context) => ScanQrScreen(), HomeScreen.routeName: (context) => HomeScreen()},
        );
      },
    );
  }
}
