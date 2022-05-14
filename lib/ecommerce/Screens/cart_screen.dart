import 'package:flutter/material.dart';
import '../Providers/cart.dart';
import 'package:provider/provider.dart';
import '../Widgets/cart_item.dart';
import '../Providers/orders.dart';

class cart_screen extends StatefulWidget {
  static const route = '/cart_screen';

  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: (Text('Your cart/آپ کی ٹوکری')),
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
                      if(isloading == false){
                        setState(() {
                          isloading = true;
                        });
                        Provider.of<Order>(context, listen: false).postorder(
                            carts.items.values.toList(), carts.getAmount).then((value) {
                          setState(() {
                            isloading = false;
                          });
                          carts.clearitems();
                        });
                      }

                    },
                    child: isloading? Center( child: CircularProgressIndicator(),):Text("Order Now/ابھی آرڈر کریں۔ "),
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
                carts.items.values.toList()[index].imgurl,
                id: carts.items.values.toList()[index].id,
                title: carts.items.values.toList()[index].title,
                quantity: carts.items.values.toList()[index].quantity,
                price: carts.items.values.toList()[index].price,
                product_id: carts.items.keys.toList()[index],
                iscreditaval:carts.items.values.toList()[index].iscrediavail,
                storeid: carts.items.values.toList()[index].storeid,
            ),

            itemCount: carts.numberofitems,
          ))
        ],
      ),
    );
  }
}
