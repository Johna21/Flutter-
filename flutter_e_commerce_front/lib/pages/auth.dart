
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';
import 'database.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based n FirebaseUser
  UserClass _userFromFirebaseUser(User user){
    return user != null ? UserClass(uid: user.uid ): null;
  }

  // auth change user stream

  Stream<User>get user{
    return _auth.authStateChanges();

  }

  // sign in anonymously

  Future signInAnon() async{
    try{
      UserCredential  result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){

      print(e.toString());
      return null;

    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password)  async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){

      print(e.toString());
      return null;
    }
  }

// register with email and password

  Future registerWithEmailAndPassword(String email, String password)  async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

// create a new document for the user with the uid
      await DatabseService(uid: user.uid).updatedUserData('0', 'new crew member', 100);

      return _userFromFirebaseUser(user);
    }catch(e){

      print(e.toString());
      return null;
    }
  }

// Sign out

  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }



}