import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class product with ChangeNotifier{
  final String id;
  final String storeid;
  final String title;
  final String descrip;
  final Image imgurl;
  final String category;
  final int price;
  final int quant;
  bool isfavourite;
  bool iscreditavailable;


  product({
    required this.id,
    required this.title,
    required this.descrip,
    required this.price,
    required this.imgurl,
    required this.quant,
    required this.category,
    required this.storeid,
    required this.iscreditavailable,
    this.isfavourite = false,
  });

  void isfavoritetoggle(){
    this.isfavourite = !this.isfavourite;
    notifyListeners();
  }

}