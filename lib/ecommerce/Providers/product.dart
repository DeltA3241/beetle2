import 'package:flutter/foundation.dart';

class product with ChangeNotifier{
  final String id;
  final String title;
  final String descrip;
  final double price;
  final String imgurl;
  bool isfavourite;


  product({
    required this.id,
    required this.title,
    required this.descrip,
    required this.price,
    required this.imgurl,
    this.isfavourite = false,
  });

  void isfavoritetoggle(){
    this.isfavourite = !this.isfavourite;
    notifyListeners();
  }

}