import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/sebha.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SebhaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}