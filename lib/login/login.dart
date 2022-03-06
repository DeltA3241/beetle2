import 'package:beetle/utilities/beetle_networking.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: kLoginTheme,
      title: 'Beetle',
      logoTag: 'logo_main',
      titleTag: 'title_main',
      logo: const AssetImage('assets/images/png_files/Beetle.png'),
      onLogin: (LoginData data) async {
        // http.Response response =
        //     await BeetleNetworking().loginUser(data.name, data.password);
        // if (response.statusCode == 200) {
        //   return null;
        // } else {
        //   return 'check credentials';
        // }
      },
      onRecoverPassword: (String email) {},
      onSignup: (SignupData signupdata) async {
        Map<String, String?> signupDetails = {
          'username': signupdata.name,
          "password": signupdata.password,
          "password2": signupdata.password,
          "email": signupdata.name,
          "first_name": signupdata.additionalSignupData!['First Name'],
          "last_name": signupdata.additionalSignupData!['Last Name'],
        };
        http.Response response =
            await BeetleNetworking().signupUser(signupDetails);
      },
      onSubmitAnimationCompleted: () {
        //if (login) {
        Navigator.pushReplacementNamed(context, kMainpages[1]);
        //}
      },
      additionalSignupFields: const [
        UserFormField(
          keyName: 'First Name',
          displayName: 'FirstName / پہلا نام',
        ),
        UserFormField(
          keyName: 'Last Name',
          displayName: 'Last Name / آخری نام',
        ),
      ],
      messages: kLoginMessages,
    );
  }
}
