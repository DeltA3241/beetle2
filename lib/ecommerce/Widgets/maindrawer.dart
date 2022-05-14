import 'package:flutter/material.dart';
import '../Screens/orders_screen.dart';




class maindrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Text("Options/اختیارات", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),),
            color: Theme.of(context).primaryColor
          ),
          ListTile(
            title: Text("Shop/دکان", style: TextStyle(fontSize: 20),) ,
            leading: Icon(Icons.shop, size:30),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text("Orders/آرڈر", style: TextStyle(fontSize: 20),),
            leading: Icon(Icons.shopping_bag, size: 30),
            onTap: (){
              Navigator.of(context).pushNamed(orders_screen.route);
            },

          ),

        ],
      ),
    );
  }
}
