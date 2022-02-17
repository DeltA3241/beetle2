import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Beetle',
            ),
          ),
          body: const Center(
            child: Text('Beetle'),
          ),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.orange,
            items: const [
              TabItem(icon: FontAwesomeIcons.bug, title: 'AI'),
              TabItem(icon: FontAwesomeIcons.shoppingBag, title: 'ECommerce'),
              TabItem(icon: FontAwesomeIcons.alignLeft, title: 'Forumn'),
              TabItem(icon: Icons.settings, title: 'Settings'),
              TabItem(icon: Icons.people, title: 'Profile'),
            ],
            //initialActiveIndex: 0,
            onTap: (int i) => print('click index=$i'),
          ),
        ));
  }
}
