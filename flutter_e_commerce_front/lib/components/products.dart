import 'package:flutter_church/pages/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "blazer",
      "picture": "images/products/blazer1.jpeg",
      "weekly_price": 10,
      "monthly_price": 80,
      "yearly_price": 200,
    },
    {
      "name": "dress",
      "picture": "images/products/dress1.jpeg",
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
      "name": "skert",
      "picture": "images/products/skt2.jpeg",
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
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_weekly_price: product_list[index]['weekly_price'],
            prod_monthly_price: product_list[index]['monthly_price'],
            prod_yearly_price: product_list[index]['yearly_price'],
          );
        });
  }
}
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_weekly_price;
  final prod_monthly_price;
  final prod_yearly_price;

  Single_prod({
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

