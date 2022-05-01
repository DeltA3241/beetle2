import 'package:beetle/driver.dart';
import 'package:beetle/login/login.dart';
import 'package:flutter/material.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const Beetle());
}

class Beetle extends StatelessWidget {
  const Beetle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("fa", "IR"),
        Locale('ur', "ur_PK")
      ],
      debugShowCheckedModeBanner: false,
      title: 'Beetle',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: kAppBarTheme,
      ),
      initialRoute: kMainpages[0],
      routes: {
        kMainpages[1]: (context) => const Driver(),
        kMainpages[0]: (context) => LoginPage(),
      },
    );
  }
}
