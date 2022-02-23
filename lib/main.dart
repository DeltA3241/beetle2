import 'package:beetle/disease_detection/disease_detedtion_main.dart';
import 'package:beetle/login/login.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beetle',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: kAppBarTheme,
      ),
      initialRoute: kMainpages[1],
      routes: {
        kMainpages[5]: ((context) => const LoginPage()),
        kMainpages[0]: ((context) => const DiseaseDetectionMain()),
      },
    );
  }
}
