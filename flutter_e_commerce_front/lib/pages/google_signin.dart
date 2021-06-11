import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{

  final googleSignIn = GoogleSignIn();

 bool _isSignIn =false;

 GoogleSignInProvider(){
   _isSignIn =false;

 }
 bool get isSigningIn => _isSignIn;

 set isSigningIn(bool isSignIn){
   _isSignIn = isSigningIn;
   notifyListeners();
 }

  Future login() async{

   isSigningIn = true;

   final guser = await googleSignIn.signIn();
   if(guser == null){
     isSigningIn = false;
     return;
   }else{
     final googleAuth = await guser.authentication;
     final credential = GoogleAuthProvider.credential(
       accessToken: googleAuth.accessToken,
       idToken: googleAuth.idToken,
     );
     await FirebaseAuth.instance.signInWithCredential(credential);
     isSigningIn = false;
   }

  }
void logout() async{
   await googleSignIn.disconnect();
   FirebaseAuth.instance.signOut();
}
}