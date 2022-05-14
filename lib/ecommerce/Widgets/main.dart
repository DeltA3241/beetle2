import 'package:flutter/material.dart';
import '../Screens/product_overview_screen.dart';
import '../Screens/product_detail_screen.dart';
import '../Screens/cart_screen.dart';
import '../Screens/orders_screen.dart';
import '../Screens/search_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'سٹور',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrange,
      ),
      home: product_overview_screen(),
      routes: {
        product_detail_screen.route: (ctx) => product_detail_screen(),
        cart_screen.route: (ctx) => cart_screen(),
        orders_screen.route: (ctx) => orders_screen(),
        search_screen.route: (ctx) => search_screen(),
      },
    );
  }
}
