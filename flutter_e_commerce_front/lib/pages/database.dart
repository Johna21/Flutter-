import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabseService{

  final String uid;
  DatabseService({this.uid});

  // collection reference

  final CollectionReference asratCollection = FirebaseFirestore.instance.collection('asrat') ;
  Future updatedUserData(String sugars, String name, int strength) async{
    return await asratCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
  // get asrat stream

  Stream<QuerySnapshot>get asrat{
    return asratCollection.snapshots();
  }
}