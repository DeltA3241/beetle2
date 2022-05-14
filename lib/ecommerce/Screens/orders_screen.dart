import 'package:flutter/material.dart';
import '../Providers/orders.dart';
import 'package:provider/provider.dart';
import '../Widgets/orders_widget.dart';

class orders_screen extends StatefulWidget {
  static const route = '/orders';

  @override
  State<orders_screen> createState() => _orders_screenState();
}

class _orders_screenState extends State<orders_screen> {
  var isinit = true;
  var isloading = false;


  @override
  void didChangeDependencies() {
    if(isinit){
      setState(() {
        isloading = true;
      });

      Provider.of<Order>(context).getOrder().then((_){
        setState(() {
          isloading = false;
        });


      });
    }
    isinit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final order_set = Provider.of<Order>(context).get_order;

    return Scaffold(
      appBar: AppBar(title: Text("Your Orders/آپ کے آرڈر"),),

      body:isloading? Center(child: CircularProgressIndicator()):SingleChildScrollView( child: Column(children: [ListView.builder(shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),itemBuilder: (ctx, index )=> orders_widget(order: order_set[index],), itemCount: order_set.length,),])),

    );
  }
}
