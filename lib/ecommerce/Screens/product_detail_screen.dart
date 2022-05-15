import 'package:beetle/ecommerce/Screens/search_screen.dart';
import 'package:flutter/material.dart';
import '../../utilities/constants.dart';
import '../Providers/cart.dart';
import '../Providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../Screens/cart_screen.dart';

import '../Widgets/badge.dart';

int numofitems = 1;

class product_detail_screen extends StatelessWidget {
  static const route = '/product_detail';
  final dynamic? id;
  product_detail_screen([this.id]);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final carts = Provider.of<cart>(context);
    final product_id =  id == null ? ModalRoute.of(context)!.settings.arguments as String : id as String;
    final product =
        Provider.of<Products>(context, listen: false).findproduct(product_id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kBeetleMainColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(search_screen.route);
              },
              icon: const Icon(Icons.search_rounded)),
          Consumer<cart>(
            builder: (_, c, ch) => Badge(
              child: ch!,
              value: carts.numberofitems.toString(),
              color: Theme.of(context).accentColor,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(cart_screen.route);
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.38),
                    decoration: const BoxDecoration(
                        color: kBeetleMainColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                product.descrip,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CartCounter(product_id),
                            TextButton.icon(
                                onPressed: null,
                                icon: const Icon(
                                  Icons.credit_card,
                                  color: Colors.white,
                                ),
                                label: product.iscreditavailable
                                    ? const Text(
                                        "Credit/کریڈٹ",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : const Text(
                                        "No Credit/کوئی کریڈٹ نہیں",
                                        style: TextStyle(color: Colors.white),
                                      )),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              height: 50,
                              width: 58,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Colors.white,
                                  )),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                        color: Colors.white,
                                      )),
                                  child: OutlinedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: kBeetleMainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        padding: EdgeInsets.zero),
                                    onPressed: () {
                                      carts.add_items(
                                          product.id,
                                          product.title,
                                          product.price,
                                          product.iscreditavailable,
                                          product.imgurl,
                                          product.storeid,
                                          q1: numofitems);
                                     /* Scaffold.of(context)
                                          .hideCurrentSnackBar();
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: const Text(
                                            "Item added to shopping Cart"),
                                        duration: Duration(seconds: 1),
                                        action: SnackBarAction(
                                          label: "Undo",
                                          onPressed: () {
                                            carts.remove_singleitem(product.id);
                                          },
                                        ),
                                      ));*/
                                    },
                                    child: const Text(
                                      "Buy Now/ابھی خریدئے ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.category,
                          style:
                              const TextStyle(color: kBeetleMainColor, fontSize: 20),
                        ),
                        Text(
                          product.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: kBeetleMainColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                  text: 'Price\n',
                                  style: TextStyle(
                                      color: kBeetleMainColor, fontSize: 20),
                                ),
                                TextSpan(
                                    text: "Rs${product.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                          color: kBeetleMainColor,
                                          fontWeight: FontWeight.bold,
                                        )),
                              ]),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: Container(
                                width: 100,
                                height: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.scaleDown,
                                    image: product.imgurl.image,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  final dynamic? id;
  CartCounter([this.id]);
  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  Widget build(BuildContext context) {
    final product_id = widget.id == null ? ModalRoute.of(context)!.settings.arguments as String : widget.id as String;
    final product =
        Provider.of<Products>(context, listen: false).findproduct(product_id);
    return Row(
      children: [
        buildSizedBox(Icons.remove, () {
          setState(() {
            if (numofitems >= 1) {
              numofitems--;
            }
          });
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            numofitems.toString().padLeft(2, '0'),
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        buildSizedBox(Icons.add, () {
          setState(() {
            if (numofitems <= product.quant) {
              numofitems++;
            }
          });
        }),
      ],
    );
  }

  SizedBox buildSizedBox(IconData icon, VoidCallback press) {
    return SizedBox(
      width: 40,
      height: 32,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.white,
            )),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
              primary: kBeetleMainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              padding: EdgeInsets.zero),
          onPressed: press,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
