import 'package:flutter/material.dart';

class HorizontlaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Catagory(

            image_location: 'images/cats/tshirt.png',
            image_caption: 'መጽሔት',
          ),

          Catagory(
            image_location: 'images/cats/dress.png',
            image_caption: 'አስራት',
          ),
          Catagory(
            image_location: 'images/cats/jeans.png',
            image_caption: 'Interview',
          ),
          Catagory(
            image_location: 'images/cats/shoe.png',
            image_caption: 'Blogs',
          )

        ],
      ),
    );
  }
}
class Catagory extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Catagory({
    this.image_location,
    this.image_caption
  });
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100.0,
          child:  ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption),
            ),
          ),

        ),

      ),);
  }
}

