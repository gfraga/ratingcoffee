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



    return new MaterialApp(
      title: 'Classificação de Cafés',
      theme: new ThemeData(        
        //Set the theme of the App (Material Design)
        primarySwatch: Colors.brown,
      ),      
      home: MyHomePage('Lista de Cafés')
    );
  }
}

