import 'package:beetle/disease_detection/disease_detection_main.dart';
import 'package:beetle/ecommerce/ecommerce_main.dart';
import 'package:beetle/forum/forum_main.dart';
import 'package:beetle/profile/profile_main.dart';
import 'package:beetle/settings/settings_main.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  final List<Widget> screenWidgets = [
    const DiseaseDetectionMain(),
    const ECommerceMain(),
    const ForumMain(),
    const SettingsMain(),
    const ProfileMain(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kBeetleAppBar,
      body: Center(
        child: screenWidgets[_selectedIndex],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: kBeetleMainColor,
        items: const [
          TabItem(icon: FontAwesomeIcons.bug, title: 'AI'),
          TabItem(icon: FontAwesomeIcons.shoppingBag, title: 'ECommerce'),
          TabItem(icon: FontAwesomeIcons.alignLeft, title: 'Forum'),
          TabItem(icon: Icons.settings, title: 'Settings'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(
            () {
              _selectedIndex = i;
            },
          );
        },
      ),
    );
  }
}
