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
      body: new Center(
        child: new Column(          
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),                                
                children: <Widget>[
                  ListTile(
                    title: Text('Winter')
                  ),
                  ListTile(
                    title: Text('Ademílson')
                  ),
                  ListTile(
                    title: Text('61')
                  )                       
                ],
            )
          ],
        ),
      )
    );
  }
}
