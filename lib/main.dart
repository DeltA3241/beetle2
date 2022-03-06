import 'package:beetle/driver.dart';
import 'package:beetle/login/login.dart';
import 'package:flutter/material.dart';
import 'package:beetle/utilities/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
