import 'package:flutter/material.dart';
import '../Providers/cart.dart';
import 'package:provider/provider.dart';
import '../Widgets/cart_item.dart';
import '../Providers/orders.dart';

class cart_screen extends StatelessWidget {
  static const route = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: (Text('Your cart')),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text('\Rs ${carts.getAmount.toStringAsFixed(2)}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Order>(context, listen: false).addOrder(
                          carts.items.values.toList(), carts.getAmount);
                      carts.clearitems();
                    },
                    child: Text("Order Now"),
                    shape: StadiumBorder(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) => cart_item1(
                id: carts.items.values.toList()[index].id,
                title: carts.items.values.toList()[index].title,
                quantity: carts.items.values.toList()[index].quantity,
                price: carts.items.values.toList()[index].price,
                imgurl: carts.items.values.toList()[index].imgurl,
                product_id: carts.items.keys.toList()[index]),
            itemCount: carts.numberofitems,
          ))
        ],
      ),
    );
  }
}
