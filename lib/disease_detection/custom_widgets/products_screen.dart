import 'package:beetle/ecommerce/Screens/product_detail_screen.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ecommerce/Providers/product_provider.dart';

class Product1 extends StatefulWidget {
  static const route = '/Products';
  const Product1({Key? key}) : super(key: key);

  @override
  State<Product1> createState() => _Product1State();
}

class _Product1State extends State<Product1> {
  @override
  Widget build(BuildContext context) {
    final p1 = Provider.of<Products>(context).disease_items;
    return Scaffold(
      appBar: kBeetleAppBar,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: p1[index].imgurl.image,
              backgroundColor: Colors.transparent,
            ),
            title: Text(
              p1[index].title,
              style: TextStyle(color: Colors.white),
            ),
            tileColor: kBeetleMainColor,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => product_detail_screen(p1[index].id)));
            },
          );
        },
        itemCount: p1.length,
      ),
    );
  }
}
