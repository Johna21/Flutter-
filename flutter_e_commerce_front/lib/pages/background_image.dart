import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/src/painting/gradient.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black,Colors.black12],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
          image: DecorationImage(
              image: AssetImage('images/back.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45,
                  BlendMode.darken)
          )
      ),
    );
  }
}
class BackgroundRegister extends StatelessWidget {
  const BackgroundRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black,Colors.black12],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
          image: DecorationImage(
              image: AssetImage('images/reg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45,
                  BlendMode.darken)
          )
      ),
    );
  }
}
