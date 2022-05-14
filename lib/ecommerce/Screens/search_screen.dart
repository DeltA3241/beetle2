import 'dart:async';

import 'package:beetle/utilities/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/product_provider.dart';
import '../Screens/product_detail_screen.dart';

class search_screen extends StatefulWidget {
  static const route = '/search';

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  TextEditingController _textEditingController = TextEditingController();
 var isinit = true;
 String text1 = '';

  @override
  Widget build(BuildContext context) {
    var products_data = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
            height: 50 ,
            width: 300 ,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: "Search Here/یہاں تلاش کریں ",
              ),
              onChanged: (text) {
                Provider.of<Products>(context,listen: false).searchproduct(text);
              },
            ),
          ),

      ),
      body: products_data.search_items.isEmpty? Center(child: Text("Sorry nothing found/افسوس نہیں ملا", textAlign: TextAlign.center, style: TextStyle(color: kBeetleMainColor, fontSize: 20, fontWeight: FontWeight.bold),)) :ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: products_data.search_items[index].imgurl.image,
            backgroundColor: Colors.transparent,
          ),
          title: Text(products_data.search_items[index].title, style: TextStyle(color: Colors.white),),
          tileColor: kBeetleMainColor,
          onTap: (){
            Navigator.of(context).pushNamed(
              product_detail_screen.route,
              arguments: products_data.search_items[index].id,
            );
          },

        );

      },itemCount: products_data.search_items.length,),
        resizeToAvoidBottomInset: false,
    );

  }

}
