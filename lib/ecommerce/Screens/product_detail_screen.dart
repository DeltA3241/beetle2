import 'package:flutter/material.dart';
import '../Providers/product_provider.dart';
import 'package:provider/provider.dart';

class product_detail_screen extends StatelessWidget {
  static const route = '/product_detail';

  @override
  Widget build(BuildContext context) {
    final product_id = ModalRoute.of(context)!.settings.arguments as String;
    final product =
        Provider.of<Products>(context, listen: false).findproduct(product_id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
