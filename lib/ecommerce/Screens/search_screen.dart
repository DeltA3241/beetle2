import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/product_provider.dart';
import '../Widgets/product_overview_widget.dart';
import '../Providers/product.dart';

class search_screen extends StatefulWidget {
  static const route = '/search';

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final products_data = Provider.of<Products>(context);
    final products1 = products_data.get_items;
    List<product> products = products1
        .where((element) => element.title == _textEditingController.text)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: "Search",
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
            value: products[index], child: product_overview_widget()),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
