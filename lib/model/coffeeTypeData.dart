import 'package:cloud_firestore/cloud_firestore.dart';

class CoffeeTypeData {

  final DocumentReference reference;

  String type;
  
  CoffeeTypeData.data(this.reference,
      [this.type]) {

    this.type ??= 'Catuaí';  
  }

  static DefaultType () {
    return new CoffeeTypeData.data(null);
  }

  Map<String, dynamic> toMap() {    
    return {
      'type': type
    };
  }  
}