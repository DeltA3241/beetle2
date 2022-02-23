import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:beetle/constants.dart';
import 'package:flutter/material.dart';

class DiseaseDetectionMain extends StatelessWidget {
  const DiseaseDetectionMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Hero(
              tag: 'logo_main',
              child: Image(
                image: AssetImage('assets/images/png_files/Beetle.png'),
                height: 40,
              ),
            ),
            Hero(
              tag: 'title_main',
              child: Text(
                'Beetle',
                style: TextStyle(color: Color(0xffff420e)),
              ),
            )
          ],
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
        onTap: (int i) =>
            Navigator.pushReplacementNamed(context, kMainpages[i]),
      ),
    );
  }
}
