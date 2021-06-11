import 'package:flutter/material.dart';

class Cart_list extends StatefulWidget {
  @override
  _Cart_listState createState() => _Cart_listState();
}

class _Cart_listState extends State<Cart_list> {

  var Products_on_the_cart = [
    {
      "name": "blazer",
      "picture": "images/products/blazer1.jpeg",
      "weekly_price": 10,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Shoes",
      "picture": "images/products/hills1.jpeg",
      "weekly_price": 10,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length ,
        itemBuilder: (context,index){
          return Single_cart_prod(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
            cart_prod_size: Products_on_the_cart[index]["size"],
            cart_prod_weekly_price: Products_on_the_cart[index]["weekly_price"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
          );
        }
    );
  }


}

class Single_cart_prod extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_weekly_price;
  final cart_prod_size;
  final cart_prod_color;
  var cart_prod_qty;

  Single_cart_prod({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_weekly_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        //  LEADING SECTION
        leading: new Image.asset(cart_prod_picture,
          width: 60.0,
          height: 100.0,
        ),

        // TITLE SECTION
        title: new Text(cart_prod_name),
        // SUBTITLE SECTION
        subtitle: new Column(
          children: [
            // ROW INSIDE THE COLUMN
            new Row(
              children: [
                // this section is for the size of the product

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text("size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_size, style: TextStyle(color: Colors.red),),
                ),
                // ===== this section is for the color of the porduct

                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 10.0),
                  child: new Text("Color:"),),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_color, style: TextStyle(color: Colors.red),),
                )

              ],
            ),

            // THIS SECTION IS FOR THE PRODUCT PRICE =====

            new Container(
              alignment: Alignment.topLeft,
              child: new Text("\$${cart_prod_weekly_price}",
                style: TextStyle(fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),),
            ),


          ],
        ) ,
        // trailing: new Column(
        //                children: [
        //                       new IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){}),
        //                       new Text("$cart_prod_qty"),
        //                       new IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){}),
        //
        //
        //
        //
        //
        //
        //                 ],
        // ),
        trailing: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),

                  child: Column(
                    children: [
                      new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
                      new Text("$cart_prod_qty"),
                      new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})],

                  )

              ),

            ],
          ),

        ),
      ),
    );
  }
// void addQuantity(){
//     cart_prod_qty = cart_prod_qty+1;   }
}


