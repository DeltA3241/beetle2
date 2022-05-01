import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier{
  List <product> _items = [
    product(
      id: 'p1',
      title: 'Red Shirt',
      descrip: 'A red shirt - it is pretty red!',
      price: 29.99,
      imgurl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    product(
      id: 'p2',
      title: 'Trousers',
      descrip: 'A nice pair of trousers.',
      price: 59.99,
      imgurl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    product(
      id: 'p3',
      title: 'Yellow Scarf',
      descrip: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imgurl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    product(
      id: 'p4',
      title: 'A Pan',
      descrip: 'Prepare any meal you want.',
      price: 49.99,
      imgurl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

 List <product> get get_items{
   return [..._items];
}



void addProduct(){

   notifyListeners();
}

product findproduct( var product_id){
   return _items.firstWhere((item) => item.id == product_id );
}




}