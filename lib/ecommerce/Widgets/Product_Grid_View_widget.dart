import 'package:flutter/material.dart';
import'./product_overview_widget.dart';
import 'package:provider/provider.dart';
import'../Providers/product_provider.dart';




class Product_Grid_View extends StatelessWidget {
  final bool favcheck;
  Product_Grid_View( this.favcheck);


  @override
  Widget build(BuildContext context) {
    final products_data = Provider.of<Products>(context);
    final products1 =  products_data.get_items;
    final products = favcheck ? products1.where((p) => p.isfavourite).toList() : products1;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx,index) =>  ChangeNotifierProvider.value( value:products[index] ,child: product_overview_widget()),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}





