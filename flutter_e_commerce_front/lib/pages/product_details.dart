import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_church/main.dart';
import 'home.dart';


class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final prduct_detail_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.prduct_detail_price,
    this.product_detail_picture
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amberAccent,
        title: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> new HomePage()));
            },
            child: Text('ASRAT')),
        actions: [
          new IconButton(icon: Icon(Icons.search, color: Colors.black,), onPressed: (){}),

          //new IconButton(icon: Icon(Icons.person, color: Colors.black,), onPressed: (){})
        ],
      ),

      body: new Column(
        children: [
          new Container(
            height: 160.0,
            child: GridTile(
              child: Container(
                color: Colors.white10,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white60,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0 ),),
                  title: new Row(
                    children: [
                      Expanded(
                          child: new Text("\$${widget.prduct_detail_price}",
                            style: TextStyle(color: Colors.grey),)
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ),

          //  ======= the First Button ======

          Row(
            children: [
              // ===== Size Button =====

              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                      builder: (context){
                        return new AlertDialog(
                          title: new Text("Size"),
                          content: new Text("Choose the size"),
                          actions: [
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("Close"),)
                          ],
                        );
                      });
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: new Text("Size")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                      builder: (context){
                        return new AlertDialog(
                          title: new Text("Color"),
                          content: new Text("Choose the Color"),
                          actions: [
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("Close"),)
                          ],
                        );
                      });
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: new Text("Colors")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                      builder: (context){
                        return new AlertDialog(
                          title: new Text("Qty"),
                          content: new Text("Choose the number you want"),
                          actions: [
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("Close"),)
                          ],
                        );
                      });
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: new Text("Qty")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ==== the Second Button =====

          Row(
            children: <Widget> [


              // the Size Button ====
              Expanded(
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy Now"),
                  )
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.red,), onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border, color: Colors.red,), onPressed: (){}),


            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details "),
            subtitle: new Text(" ይህን እቃ በኢትዮጵያዊያን የተመረተ ሲሆን በተከክተበት አደጋም ሆነ በሰራነው ስራ ላይ እጅግ ወድ ኣን እን ተቃሚ በምሆኑ እንዲገዙት እናሳስባለን። "),
          ),
          Divider(),
          new Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0 , 5.0, 5.0),
                child: new Text("Product name", style: TextStyle(color: Colors.grey,),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name ),)

            ],
          ),
          new Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0 , 5.0, 5.0),
                child: new Text("Product brand", style: TextStyle(color: Colors.grey,),),
              ),

              // REMEMBER TO CREATE PRODUC BRAND
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Brand x"),)
            ],
          ),

          // ADD PRODUCT CONDITIONS

          new Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0 , 5.0, 5.0),
                child: new Text("Product conditions", style: TextStyle(color: Colors.grey,),),
              ),

              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("NEW" ),)


            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar Products"),
          ),

          // SIMILAR PRODUCT SECTION

          Flexible(child: Similar_product()),



        ],
      ),
    );
  }
}
class Similar_product extends StatefulWidget {
  @override
  _Similar_productState createState() => _Similar_productState();
}

class _Similar_productState extends State<Similar_product> {
  var product_list = [
    {
      "name": "blazer",
      "picture": "images/products/blazer1.jpeg",
      "weekly_price": 10,
      "monthly_price": 80,
      "yearly_price": 200,
    },

    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "weekly_price": 10,
      "monthly_price": 80,
      "yearly_price": 200,
    },

    {
      "name": "dress",
      "picture": "images/products/dress2.jpeg",
      "weekly_price": 10,
      "monthly_price": 80,
      "yearly_price": 200,
    },
    {
      "name": "skert",
      "picture": "images/products/skt1.jpeg",
      "weekly_price": 10,
      "monthly_price": 80,
      "yearly_price": 200,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Similar_Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_weekly_price: product_list[index]['weekly_price'],
            prod_monthly_price: product_list[index]['monthly_price'],
            prod_yearly_price: product_list[index]['yearly_price'],
          );
        });
  }
}
class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_weekly_price;
  final prod_monthly_price;
  final prod_yearly_price;

  Similar_Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_weekly_price,
    this.prod_monthly_price,
    this.prod_yearly_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=> new ProductDetails(
                  // here is passing the values of the products to another page
                  product_detail_name: prod_name,
                  prduct_detail_price: prod_weekly_price,
                  product_detail_picture: prod_picture,
                ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: new Row(children: [
                  Expanded(
                    child:Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,),),
                  ),
                  new Text("\$$prod_weekly_price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.0),)
                ],) ,

              ),
              child: Image.asset(prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

