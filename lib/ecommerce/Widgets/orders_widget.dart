import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Providers/orders.dart';
import 'package:provider/provider.dart';
import 'dart:math';


class orders_widget extends StatefulWidget {
final orderitem order;

orders_widget({required this.order});

  @override
  State<orders_widget> createState() => _orders_widgetState();
}

class _orders_widgetState extends State<orders_widget> {
  bool isexpanded = false;
  int count =0;
  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children : [ListTile(
          title: Text('Rs${widget.order.amount.toStringAsFixed(2)}'),
          subtitle: Text(widget.order.dateTime),
          trailing: IconButton( icon: Icon( isexpanded? Icons.expand_less :Icons.expand_more), onPressed: (){
            setState(() {
              isexpanded = !isexpanded;
            });
          },),
        ),
          if(isexpanded) Container(
            padding: EdgeInsets.all(20),
            height: min( widget.order.products.length * 20  + 50, 100),
            child: ListView(
              children: widget.order.products.map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      Text(e.title, style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('Rs${e.price}x${e.quantity}'),
                ],
              )).toList()
            ),

          ),
      ]),



    );
  }
}
