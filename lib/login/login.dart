import 'package:beetle/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: kLoginTheme,
      title: 'Beetle',
      logoTag: 'logo_main',
      titleTag: 'title_main',
      logo: const AssetImage('assets/images/png_files/Beetle.png'),
      onLogin: (LoginData data) {},
      onRecoverPassword: (String email) {},
      onSignup: (SignupData signupdata) {},
      onSubmitAnimationCompleted: () {
        Navigator.pushNamed(context, kMainpages[0]);
      },
      messages: kLoginMessages,
    );
  }
}
