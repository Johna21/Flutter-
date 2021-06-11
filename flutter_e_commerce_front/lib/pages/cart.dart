
import 'package:flutter/material.dart';

// MY imports

import 'package:flutter_church/components/cart_product.dart ';


class Cart  extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amberAccent,
        title: Text('cart'),
        actions: [
          new IconButton(
              icon: Icon(Icons.search,
                color: Colors.black,),
              onPressed: (){}),

          // new IconButton(icon: Icon(Icons.person, color: Colors.black,), onPressed: (){})
        ],
      ),

      // body: new Cart_products(),

      body: new Cart_list(),
      bottomNavigationBar:  new Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(child: ListTile(
              title: new Text("Total"),
              subtitle: new Text("\$230"),
            )),
            Expanded(child: new MaterialButton(onPressed: (){},
              child: new Text("Chekout", style: TextStyle(color: Colors.white),),
              color: Colors.red,),
            )
          ],
        ),
      ),

    );
  }
}
