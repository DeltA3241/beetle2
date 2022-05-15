import 'package:beetle/driver.dart';
import 'package:beetle/ecommerce/Providers/orders.dart';
import 'package:beetle/login/login.dart';
import 'package:flutter/material.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'ecommerce/Providers/cart.dart';
import 'ecommerce/Providers/product_provider.dart';
import 'ecommerce/Screens/cart_screen.dart';
import 'ecommerce/Screens/orders_screen.dart';
import 'ecommerce/Screens/product_detail_screen.dart';
import 'ecommerce/Screens/search_screen.dart';

void main() {
  runApp(const Beetle());
}

class Beetle extends StatelessWidget {
  const Beetle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Order(),
        ),
      ],

      child: MaterialApp(
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
          product_detail_screen.route: (ctx) => product_detail_screen(),
          cart_screen.route: (ctx) => cart_screen(),
          orders_screen.route: (ctx) => orders_screen(),
          search_screen.route: (ctx) => search_screen(),
        },
      ),
    );
  }
}
