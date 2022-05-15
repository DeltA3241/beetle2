import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

const kBaseUrl = 'https://beetle-auth.azurewebsites.net/auth';
const kBaseUrlForum =
    'https://beetle-discussion-forum.azurewebsites.net/beetle';
const String kDiseaseDetectionBaseURL =
    'http://a480-37-111-137-241.ngrok.io/analytics/analyse';

BorderRadius kBorderRadiusForumCards = BorderRadius.circular(20);
BoxDecoration kForumCardDecoration = BoxDecoration(
  color: Colors.orangeAccent,
  borderRadius: kBorderRadiusForumCards,
);
BoxDecoration kCommentCardDecoration = BoxDecoration(
  color: Colors.orange[900],
  borderRadius: kBorderRadiusForumCards,
);

const TextStyle kForumTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const String kBeetleImagePath = 'assets/images/png_files/Beetle_FULL.png';
const String kWalkingPlant = 'assets/lottie_animations/walking_plant.json';
const String kBeetleloading = 'assets/lottie_animations/beetle.json';
const String kComingSoon = 'assets/lottie_animations/coming_soon.json';
const String kHealthyPlant = 'assets/lottie_animations/healthy_plant.json';
const String kDisinfectantSpray = 'assets/lottie_animations/spray.json';
const String kProductBag = 'assets/lottie_animations/product_bag.json';

const AssetImage kBeetleFullLogo = AssetImage(
  kBeetleImagePath,
);

const TextStyle kDiseaseTitleTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w300,
  color: Colors.black,
);
const TextStyle kDiseaseDescriptionTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w200,
  color: Colors.black,
);
// const TextStyle kDiseaseDescriptionTextStyleUrdu = TextStyle(
//   fontFamily: 'NotoNastaliq',
//   fontSize: 20,
//   fontWeight: FontWeight.w200,
//   color: Colors.black,
// );

const Color kBeetleMainColor = Color(0xffff420e);

const AppBarTheme kAppBarTheme = AppBarTheme(
  backgroundColor: Colors.white,
  titleTextStyle: kAppBarTextStyle,
  elevation: 10,
  centerTitle: true,
);

const TextStyle kAppBarTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: kBeetleMainColor,
);

const List<String> kMainpages = [
  '/',
  '/driver',
];
const SnackBar kPleaseWaitImageMessage = SnackBar(
  content: Text(
    'Please wait while image is loading / تصویر لوڈ ہونے تک انتظار کریں۔',
  ),
  margin: EdgeInsets.only(
    top: 10,
    bottom: 20,
    left: 10,
    right: 10,
  ),
  behavior: SnackBarBehavior.floating,
);
const SnackBar kPleaseWait = SnackBar(
  content: Text(
    'Please wait / انتظار کریں۔',
  ),
  margin: EdgeInsets.only(
    top: 10,
    bottom: 100,
    left: 10,
    right: 10,
  ),
  behavior: SnackBarBehavior.floating,
  duration: Duration(milliseconds: 1000),
);
const SnackBar kPleaseUpload = SnackBar(
  content: Text(
    'Please select a photo and crop. / براہ کرم ایک تصویر منتخب کریں اور تراشیں۔',
  ),
  margin: EdgeInsets.only(
    top: 10,
    bottom: 100,
    left: 10,
    right: 10,
  ),
  behavior: SnackBarBehavior.floating,
  duration: Duration(milliseconds: 3000),
);
const SnackBar kDoneSnackBar = SnackBar(
  content: Text('Done / ہو گیا'),
  margin: EdgeInsets.only(
    top: 10,
    bottom: 10,
    left: 10,
    right: 10,
  ),
  behavior: SnackBarBehavior.floating,
);
const kImageAddedSnackBar = SnackBar(
  content: Text('Image Added / تصویر شامل کی گئی۔'),
  margin: EdgeInsets.only(bottom: 100, left: 10, right: 10),
  behavior: SnackBarBehavior.floating,
);
const kVoiceAddedSnackBar = SnackBar(
  content: Text('Voice Added / آواز شامل کی گئی۔'),
  margin: EdgeInsets.only(bottom: 100, left: 10, right: 10),
  behavior: SnackBarBehavior.floating,
);
const kVoiceremovedSnackBar = SnackBar(
  content: Text('Voice Removed / آواز ہٹا دی گئی۔'),
  margin: EdgeInsets.only(bottom: 100, left: 10, right: 10),
  behavior: SnackBarBehavior.floating,
);
const EdgeInsets kpaddingSearchBar = EdgeInsets.only(
  top: 10,
  left: 10,
  //right: 10,
  bottom: 10,
);

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
  titleStyle:
      const TextStyle(color: kBeetleMainColor, fontWeight: FontWeight.bold),
);

LoginMessages kLoginMessages = LoginMessages(
    loginButton: 'Login / لاگ ان',
    signupButton: 'SignUp / سائن اپ',
    forgotPasswordButton: 'Forgot Password? / پاسورڈ بھول گے؟',
    userHint: 'Email / ای میل',
    passwordHint: 'Password / پاس ورڈ',
    confirmPasswordHint: 'Confirm Password / پاس ورڈ کی تصدیق کریں',
    goBackButton: 'Go Back / واپس جاو',
    additionalSignUpSubmitButton: 'Submit / جمع کرائیں',
    // confirmRecoverIntro:
    //     'We will send new password to this email / ہم اس ای میل پر نیا پاس ورڈ بھیجیں گے۔',
    recoverPasswordButton: 'Recover / بازیافت کریں۔',
    recoverPasswordIntro:
        'Reset your password here / یہاں اپنا پاس ورڈ بازیافت کریں۔',
    additionalSignUpFormDescription:
        'please fill in this form / اس فارم کو بھریں',
    signUpSuccess: 'please log in now / براہ کرم ابھی لاگ ان کریں۔');

AppBar kBeetleAppBar = AppBar(
  iconTheme: const IconThemeData(
    color: kBeetleMainColor,
  ),
  automaticallyImplyLeading: true,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Hero(
        tag: 'logoMain',
        child: Image(
          image: const AssetImage('assets/images/png_files/Beetle.png'),
          height: 0.8 * AppBar().preferredSize.height,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      const Hero(
        tag: 'titleMain',
        child: SizedBox(
          child: Text(
            'Beetle',
          ),
        ),
      )
    ],
  ),
);

const BoxConstraints kSizeConstraints = BoxConstraints.tightFor(
  width: 90.0,
  height: 90.0,
);
const BoxConstraints kSizeConstraintsFloatingButton = BoxConstraints.tightFor(
  width: 70.0,
  height: 70.0,
);
