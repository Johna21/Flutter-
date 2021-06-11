import 'package:flutter_church/pages/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'user.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
class Wrapper extends StatelessWidget {
  // const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final user = Provider.of<User>(context);


    if (user == null){
      return Authentication();
    }else{
      return HomePage();
    }
  }
}

