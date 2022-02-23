import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

const AppBarTheme kAppBarTheme = AppBarTheme(
  backgroundColor: Colors.white,
  titleTextStyle: kAppBarTextStyle,
  elevation: 10,
  centerTitle: true,
);

const TextStyle kAppBarTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.orange,
);

const List<String> kMainpages = [
  'diseaseDetectionPage',
  'ecommercePage',
  'forumPage',
  'settingsPage',
  'profilePage',
  '/',
];

LoginTheme kLoginTheme = LoginTheme(
  footerBackgroundColor: Colors.orange,
  primaryColor: Colors.orange,
  accentColor: Colors.orange,
  pageColorLight: Colors.orange,
  pageColorDark: Colors.white,
  cardTheme: const CardTheme(
    elevation: 20,
    margin: EdgeInsets.all(10),
  ),
  buttonTheme: const LoginButtonTheme(
    backgroundColor: Colors.orange,
    highlightColor: Colors.orange,
  ),
  titleStyle: const TextStyle(
    color: Color(0xffff420e),
  ),
);

LoginMessages kLoginMessages = LoginMessages(
  loginButton: 'لاگ ان',
  signupButton: 'سائن اپ',
  forgotPasswordButton: 'پاسورڈ بھول گے؟',
  userHint: 'Email / ای میل',
  passwordHint: 'Password / پاس ورڈ',
  confirmPasswordHint: 'Confirm Password / پاس ورڈ کی تصدیق کریں',
);
