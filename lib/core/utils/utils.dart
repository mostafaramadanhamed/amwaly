import 'package:flutter/material.dart';

abstract class Utils{

 static void push(context,Widget screen){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen,));
  }
  static void pop(context){
    Navigator.of(context).pop();
  }

}
extension EmptyPadding on num{
  SizedBox get ph=> SizedBox(
      height: toDouble(),
      ); SizedBox get pw=> SizedBox(
      width: toDouble(),
      );
}