
import 'package:flutter/material.dart';
import '../Providers/cart.dart';
import 'package:provider/provider.dart';

class cart_item1 extends StatelessWidget {
  final String id;
  final String storeid;
  final String title;
  final int quantity;
  final int price;
  Image imgurl;
  final String product_id;
  final bool iscreditaval;
  cart_item1( this.imgurl, {required this.id, required this.title, required this.quantity, required this.price, required this.product_id, required this.iscreditaval, required this.storeid,} );




  @override
  Widget build(BuildContext context) {

    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, color: Colors.white, size: 40,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right:20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),

      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
        return showDialog(context: context , builder: (ctx) => AlertDialog( title: Text("Are you sure ?"), content: Text("Do you want to remove this item from the cart?",),actions: [
          FlatButton(onPressed: (){
            Navigator.of(ctx).pop(false);
          }, child: Text("No")),
          FlatButton(onPressed: (){
            Navigator.of(ctx).pop(true);
          }, child: Text("Yes")),
        ],));
      },
      onDismissed: (direction){
        print(direction);
       Provider.of<cart>(context, listen: false).remove_items(product_id);
      },



      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(backgroundImage: imgurl.image, backgroundColor: Colors.transparent,),
            title: Text(title),
            subtitle: Text('Total: Rs ${price * quantity}') ,
            trailing: Text('$quantity x'),
          ),

        ),



      ),
    ) ;
  }
}
