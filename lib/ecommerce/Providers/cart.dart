import 'package:flutter/foundation.dart';

class cart_item {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imgurl;


  cart_item({ required this.id, required this.title, required this.quantity, required this.price, required this.imgurl});


}

class cart with ChangeNotifier{
   Map<String, cart_item> _items = {};

  Map<String, cart_item> get items{
    return {..._items};
  }
  int get numberofitems{
    return  _items.length;

  }
  double  get getAmount{
    double total = 0 ;
    _items.forEach((key, value) {
      total = total + value.price * value.quantity;
    });
    return total;

  }


  void add_items( String product_id, String product_title, double product_price, String url){
  if(_items.containsKey(product_id)){
     _items.update(product_id, (existCartItem) => cart_item(id: existCartItem.id, title: existCartItem.title, quantity: existCartItem.quantity + 1, price: existCartItem.price, imgurl: url));
  }
  else{
    _items.putIfAbsent(product_id, () => cart_item(id: DateTime.now().toString(), title: product_title, quantity: 1, price: product_price, imgurl: url));
  }
  notifyListeners();

  }

  void remove_items(String productId){

    _items.removeWhere((key, value) => key == productId);
    notifyListeners();
  }

  void clearitems(){
    _items ={};
    notifyListeners();
  }

  void remove_singleitem(String productID){

    if( _items[productID]!.quantity >1){
      _items.update(productID, (value) => cart_item(id: value.id, title: value.title, quantity: value.quantity - 1, price: value.price, imgurl: value.imgurl));
    }
    else{
      _items.remove(productID);
    }





  }



}




