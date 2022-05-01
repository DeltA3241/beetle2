
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

import '../Widgets/Product_Grid_View_widget.dart';
import '../Widgets/badge.dart';
import '../Providers/cart.dart';
import '../Screens/cart_screen.dart';
import '../Widgets/maindrawer.dart';
import '../Screens/search_screen.dart';

enum states{
  fav,
  all,
}


class product_overview_screen extends StatefulWidget {



  @override
  State<product_overview_screen> createState() => _product_overview_screenState();
}

class _product_overview_screenState extends State<product_overview_screen> {

  var isitfav =false;
  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<cart>(context);
    return Scaffold(
      drawer: maindrawer() ,
      appBar: AppBar(title: const Text("Store"),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: GestureDetector(onTap: (){
            Navigator.of(context).pushNamed(search_screen.route);
          }, child: Icon(Icons.search, color: Colors.white,)),
        ),
        PopupMenuButton(icon: const Icon(Icons.more_vert,),
        onSelected: (states value){
          if(states.fav == value){
            setState(() {
              isitfav = true;
            });

          }
          if(states.all == value){
            setState(() {
              isitfav = false;

            });
          }

        },
        itemBuilder:(_) =>[
          const PopupMenuItem(child: Text("Show Favourites"), value: states.fav ,),
          const PopupMenuItem(child: Text("Show All"), value:states.all ,)
        ],
    ),
        Consumer<cart>(builder: (_, c, ch) => Badge(child: ch! , value: carts.numberofitems.toString()  , color: Theme.of(context).accentColor,), child: IconButton( icon: const Icon(Icons.shopping_cart), onPressed: () { Navigator.of(context).pushNamed(cart_screen.route);},),),

      ],
    ),
      body: Product_Grid_View(isitfav),
    );
  }
}


