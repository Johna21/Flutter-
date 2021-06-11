import 'package:flutter/material.dart';

const textInputdecoration =  InputDecoration(

  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 4.0, )
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 4.0, )
  ),
);