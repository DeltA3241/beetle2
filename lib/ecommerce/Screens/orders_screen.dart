import 'package:flutter/material.dart';
import '../Providers/orders.dart';
import 'package:provider/provider.dart';
import '../Widgets/orders_widget.dart';

class orders_screen extends StatelessWidget {
  static const route = '/orders';

  @override
  Widget build(BuildContext context) {
    final order_set = Provider.of<Order>(context).get_order;


    return Scaffold(
      appBar: AppBar(title: Text("Your Orders"),),

      body: ListView.builder(itemBuilder: (ctx, index )=> orders_widget(order: order_set[index],), itemCount: order_set.length,),

    );
  }
}
