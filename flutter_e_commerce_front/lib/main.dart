
import 'dart:async';
import 'dart:io';
import 'package:flutter_church/pages/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_church/pages/google_account.dart';

import 'package:flutter_church/pages/wrapper.dart';
import 'package:http/http.dart';
import 'package:flutter_church/pages/user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_church/pages/google_signin.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<GoogleSignInProvider>(
    //   create: (context)=>GoogleSignInProvider(),
    //   child:  MaterialApp(
    //     home: Wrapper(),
    //   ),
    // );

    //

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );

  }
}





