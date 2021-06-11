import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';

// my own imports
import 'package:flutter_church/components/horizontal_listview.dart';
import 'package:flutter_church/components/products.dart ';

import 'package:flutter_church/pages/cart.dart';
import 'auth.dart';
import 'database.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/W1.jpeg'),
          AssetImage('images/W3.jpeg'),
          AssetImage('images/W4.jpeg'),
        ],
        autoplay: false,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.blue,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return StreamProvider<QuerySnapshot>.value(
        value: DatabseService().asrat,
        child: Scaffold(
          appBar: new AppBar(
            elevation: 0.1,
            backgroundColor: Colors.amberAccent,
            title: Text('ASRAT'),
            actions: [
              new IconButton(icon: Icon(Icons.search, color: Colors.black,), onPressed: (){}),

              new IconButton(
                  icon: Icon(Icons.shopping_cart,
                    color: Colors.white,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
                  }),
              TextButton.icon(
                  onPressed: ()async{
                    await _auth.signOut();
                  },
                  icon: Icon(Icons.person),
                  label: Text('logout'))
            ],
          ),

          drawer: new Drawer(
            child: new ListView(
              children: [
                // header
                new UserAccountsDrawerHeader(
                  accountName: Text('jhon legal'),
                  accountEmail: Text('codehola21@gmil.com'),
                  currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white,),
                    ),
                  ) ,
                  decoration: new BoxDecoration(
                      color: Colors.amberAccent
                  ),
                ),
                // body
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('HomePage'),
                    leading: Icon(Icons.home, color: Colors.amberAccent),
                  ),
                ),

                InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Magazine'),
                    leading: Icon(Icons.picture_as_pdf, color: Colors.amberAccent,),
                  ),
                ),


                InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Asrat'),
                    leading: Icon(Icons.shopping_basket, color: Colors.amberAccent,),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
                  },
                  child: ListTile(
                    title: Text('Shoping cart'),
                    leading: Icon(Icons.shopping_cart, color: Colors.amberAccent,),
                  ),
                ),


                InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Favourites'),
                    leading: Icon(Icons.favorite, color: Colors.amberAccent,),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('My account'),
                    leading: Icon(Icons.person, color: Colors.amberAccent,),
                  ),
                ),


                Divider(),

                InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('Setting'),
                    leading: Icon(Icons.settings, ),
                  ),
                ),


                InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(Icons.help, ),
                  ),
                ),

              ],
            ),
          ),
          body: new Column(
            children: [
              // images carousel begins here
              image_carousel,
              // padding Widget
              // new Padding(padding: const EdgeInsets.all(8.0),
              //  child: new Text('Catagories') ,),

              // Horizontal list views begins here
              // HorizontlaList(),
              // padding Widget
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child:Container(
                  alignment: Alignment.centerLeft,

                  child: new Text('አዲስ ጉዳዮች',style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),) ,
                ),
              ),

              // grid view
              // Container(
              //   height: 180,
              //   child: Products(),
              // )
              Flexible(child: Products()),


            ],
          ),

        )
    );
  }
}
