
import 'dart:convert';

import 'package:beetle/ecommerce/Providers/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:beetle/globals.dart' as global;



class orderitem with ChangeNotifier {
  final String id;
  final int amount;
  final List<cart_item> products;
  final String dateTime;

  orderitem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Order with ChangeNotifier {
  var image1= Image.network("https://commons.wikimedia.org/wiki/File:Blank_square.svg");
  String basicAuth(String username, String password) {
    String basicAuth = 'Basic ' +
        base64Encode(
          utf8.encode(
            '$username:$password',
          ),
        );
    return basicAuth;
  }



  List<orderitem> _orders = [];

  List<orderitem> get get_order {
    return [..._orders];
  }

  Future<void> getOrder() async{

    String basicAuth1 = this.basicAuth(global.username, global.password);
    var response = await http.get(
      Uri.parse('https://beetle-shop.azurewebsites.net/shop/user/orders'),
      headers: <String, String>{
        'authorization': basicAuth1,
        'Accept': 'application/json'
      },
    );
     var extract_data = jsonDecode(response.body) as List<dynamic>;
     List<orderitem> temp = [];

     for(int x =0; x< extract_data.length;++x){

       temp.insert(
           0,
           orderitem(
               id: extract_data[x]['id'],
               amount: extract_data[x]['amount'],
               products: (extract_data[x]['items'] as List<dynamic>).map((item){
               return cart_item(
                   imgurl: image1,
                   id: item['id'],
                   storeid: item['store'],
                   title: item['name'],
                   price: item['price'],
                   quantity: item['quantity'],
                   iscrediavail: item['credit_available'],
                );
               }
           ).toList(),
               dateTime: extract_data[x]['date_created'] ,

       )
    );
     }
    _orders = temp;
    notifyListeners();
  }

  Future<void> postorder(List<cart_item> products1, int totalamount) async{

    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.post(
      Uri.parse('https://beetle-shop.azurewebsites.net/shop/user/orders'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'amount': totalamount,
          'delivery_address':"Street 35 G9 Islamabad",
          'items':   products1.map((e) =>{
            "id": e.id,
            "store": e.storeid,
            "name": e.title,
            "price": e.price,
            "quantity": e.quantity,
            "credit_available": e.iscrediavail,
          }).toList(),

        }


      ),
    );






    notifyListeners();
  }









}
