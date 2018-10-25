import 'package:flutter/material.dart';
import './model/coffeData.dart';

class MyHomePage extends StatefulWidget {
  
  final String title;
  final List<CoffeeData> coffeesData;

  MyHomePage(this.title, this.coffeesData);

  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {  

  @override
  Widget build(BuildContext context) {        

    return new Scaffold(      
      appBar: new AppBar(

        title: new Text(widget.title),
        
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Classificação de Cafés'),
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
            ),
            ListTile(
              title: Text('Lista de Cafés'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Tipos de Cafés'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            )
          ],
        )
      ) ,  
      body: new ListView.builder(
                          itemBuilder: (BuildContext context, int index) =>
                                      Text(widget.coffeesData[index].name),
                            itemCount: widget.coffeesData.length
              ) 
    );
  }
}
