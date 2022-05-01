import 'package:beetle/ecommerce/Providers/cart.dart';
import 'package:flutter/foundation.dart';

class orderitem with ChangeNotifier {
  final String id;
  final double amount;
  final List<cart_item> products;
  final DateTime dateTime;

  orderitem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Order with ChangeNotifier {
  final List<orderitem> _orders = [];

  List<orderitem> get get_order {
    return [..._orders];
  }

  void addOrder(List<cart_item> products1, double totalamount) {
    _orders.insert(
        0,
        orderitem(
            id: DateTime.now().toString(),
            amount: totalamount,
            products: products1,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
