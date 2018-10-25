import 'package:cloud_firestore/cloud_firestore.dart';
import './coffeeTypeData.dart';

class CoffeeData {

  final DocumentReference reference;

  String name;
  String farm;
  DocumentReference type;
  String coffeePicture;
  final String defaultImage = 'https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwj85O7H25jeAhWMmeAKHeyhDOYQjRx6BAgBEAU&url=https%3A%2F%2Fscience.howstuffworks.com%2Finnovation%2Fedible-innovations%2Fcoffee1.htm&psig=AOvVaw1FEQ3kFtxhBPzA5logqUen&ust=1540251876540772';

  CoffeeData.data(this.reference,
      [this.name,
      this.farm,
      this.type,
      this.coffeePicture]) {

    this.name ??= 'Winter';
    this.farm ??= 'Sul Minas';
    this.type ??= null;
    this.coffeePicture ??= defaultImage;
  }

  factory CoffeeData.from(DocumentSnapshot document) => CoffeeData.data(
      document.reference,
      document.data['name'],
      document.data['farm'],
      document.data['type'],
      document.data['coffeePicture']
  );

  Map<String, dynamic> toMap() {    
    return {
      'name': name,
      'farm': farm,
      'type': type
    };
  }  
}