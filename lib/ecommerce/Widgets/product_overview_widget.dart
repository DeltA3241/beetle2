
import '../Providers/product.dart';
import 'package:flutter/material.dart';
import '../Screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../Providers/cart.dart';



class product_overview_widget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final products = Provider.of<product>(context);
    final carts = Provider.of<cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
             child: GestureDetector(
                 child: products.imgurl,
                 onTap:(){
                   Navigator.of(context).pushNamed(
                     product_detail_screen.route,
                     arguments: products.id,
                   );
                 } ,
             ),
        footer: GridTileBar(title: Text(products.title, textAlign: TextAlign.center,), backgroundColor: Colors.black54, leading: IconButton(onPressed: (){ products.isfavoritetoggle();}, icon: Icon( products.isfavourite ? Icons.favorite : Icons.favorite_border),color: Theme.of(context).accentColor,), trailing:IconButton(onPressed: (){ carts.add_items(products.id, products.title, products.price, products.iscreditavailable,products.imgurl, products.storeid); Scaffold.of(context).hideCurrentSnackBar(); Scaffold.of(context).showSnackBar(SnackBar(content: const Text("Item added to shopping Cart"),duration:Duration(seconds: 1),action: SnackBarAction(label: "Undo", onPressed: (){ carts.remove_singleitem(products.id); },),)); }, icon: Icon(Icons.shopping_cart) ,color: Theme.of(context).accentColor,) ,)
      ),
    );
  }
}
