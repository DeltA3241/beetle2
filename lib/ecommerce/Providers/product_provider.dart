import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as Io;

class Products with ChangeNotifier {
  List<product> items = [];
  List<product> disease_items = [];
  List<product> search_items = [];
  Map<String, dynamic> dict = {};

  List<product> get get_items {
    return [...items];
  }

  Future<void> fetchdata() async {
    var uri = Uri.parse('https://beetle-shop.azurewebsites.net/shop/items');

    try {
      final response = await http.get(uri);
      final extract = jsonDecode(response.body) as List<dynamic>;
      final List<product> loadedproducts = [];
      for (int x = 0; x < extract.length; ++x) {
        var uri2 = Uri.parse(
            'https://beetle-shop.azurewebsites.net/shop/image/${extract[x]['image']}');
        final response2 = await http.get(uri2);
        final extract2 = jsonDecode(response2.body) as Map<dynamic, dynamic>;
        final decodedBytes = base64Decode(extract2['image']);
        Image i1 = Image.memory(decodedBytes);
        loadedproducts.add(product(
          id: extract[x]['id'],
          title: extract[x]['name'],
          descrip: extract[x]['description'],
          storeid: extract[x]['store'],
          price: extract[x]['price'],
          category: extract[x]['category'],
          iscreditavailable: extract[x]['credit_available'],
          quant: extract[x]['quantity'],
          isfavourite: false,
          imgurl: i1,
        ));
        items = loadedproducts;
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(List<dynamic> products) async {
    final List<product> loadedproducts = [];
    for (int x = 0; x < products.length; ++x) {
      var uri2 = Uri.parse('https://beetle-shop.azurewebsites.net/shop/image/${products[x]['image']}');
      final response2 = await http.get(uri2);
      final extract2 = jsonDecode(response2.body) as Map<dynamic, dynamic>;
      final decodedBytes = base64Decode(extract2['image']);
      Image i1 = Image.memory(decodedBytes);
      loadedproducts.add(product(
        id: products[x]['id'],
        title: products[x]['name'],
        descrip: products[x]['description'],
        storeid: products[x]['store'],
        price: products[x]['price'],
        category: products[x]['category'],
        iscreditavailable: products[x]['credit_available'],
        quant: products[x]['quantity'],
        isfavourite: false,
        imgurl: i1,
      ));
    }

    disease_items = loadedproducts;

    notifyListeners();
  }

  product findproduct(var product_id) {
    return items.firstWhere((item) => item.id == product_id);
  }

  Future<void> searchproduct(String s) async {
    final List<product> temp = [];
    var uri = Uri.parse(
        'https://beetle-shop.azurewebsites.net/shop/items?search=${s}&sort=price&order=asc');
    try {
      final response = await http.get(uri);
      if (jsonDecode(response.body).runtimeType == dict.runtimeType) {
        search_items.clear();
        notifyListeners();
      } else {
        final extract = jsonDecode(response.body) as List<dynamic>;
        for (int x = 0; x < extract.length; ++x) {
          var uri2 = Uri.parse(
              'https://beetle-shop.azurewebsites.net/shop/image/${extract[x]['image']}');
          final response2 = await http.get(uri2);
          final extract2 = jsonDecode(response2.body) as Map<dynamic, dynamic>;
          final decodedBytes = base64Decode(extract2['image']);
          Image i1 = Image.memory(decodedBytes);
          temp.add(product(
            id: extract[x]['id'],
            title: extract[x]['name'],
            descrip: extract[x]['description'],
            storeid: extract[x]['store'],
            price: extract[x]['price'],
            category: extract[x]['category'],
            iscreditavailable: extract[x]['credit_available'],
            quant: extract[x]['quantity'],
            isfavourite: false,
            imgurl: i1,
          ));

          search_items = temp;
          notifyListeners();
        }
      }
    } catch (error) {
      print(error);
    }
  }
}
