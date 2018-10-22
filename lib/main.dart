import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import './model/coffeData.dart';

void main() => runApp(
  
  new MyApp()
  
);

class MyApp extends StatelessWidget {

  //Override Method to build a instance of Material APP
  @override
  Widget build(BuildContext context) {

    StreamBuilder builder = new StreamBuilder(
      stream: Firestore.instance.collection('coffee').snapshots(),
      builder: (context, asyncSnapshot) {
        var documents = asyncSnapshot.data?.documents ?? [];
        var coffeeList = documents.map((asyncSnapshot) => CoffeeData.from(asyncSnapshot)).toList();
        return MyHomePage('Lista de Cafés', coffeeList);
        },
    );

    return new MaterialApp(
      title: 'Classificação de Cafés',
      theme: new ThemeData(        
        //Set the theme of the App (Material Design)
        primarySwatch: Colors.brown,
      ),      
      home: builder
    );
  }
}

