import 'package:flutter/material.dart';
import './model/coffeData.dart';

class MyHomePage extends StatefulWidget {
  
  final String title;  

  MyHomePage(this.title);

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
              child: Icon(Icons.local_cafe, size: 100.0, color: Colors.white),
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
      body: StreamBuilder(stream: CoffeeData.colReference().snapshots(),
                          builder: (context, asyncSnapshot) {
                                  var documents = asyncSnapshot.data?.documents ?? [];
                                  List<CoffeeData> coffeesData = documents.map<CoffeeData>((asyncSnapshot) => CoffeeData.from(asyncSnapshot)).toList();

                                  return ListView.separated(
                                    separatorBuilder: (BuildContext context, int index) => Divider(height: 10.0),
                                    itemBuilder: (BuildContext context, int index) =>                                                                                                             
                                                  _createDetails(coffeesData, index),
                                    itemCount: coffeesData.length);
                            },
            ),
      floatingActionButton: new FloatingActionButton(
                                                    elevation: 0.0,
                                                    child: new Icon(Icons.add_circle),
                                                    onPressed: (){
                                                      showDialog(context: context, child:
                                                            new AlertDialog(
                                                            title: new Text("Create new Coffee"),
                                                            content: new Text("Formulário"),
                                                          )
                                                        );
                                                    }
                                                  ),
    );
  }

  ExpansionTile _createDetails(coffeesData, index) {
        return ExpansionTile(                      
                            leading: Icon(Icons.local_cafe),
                            title: Text(coffeesData[index].name),
                            children: <Widget> [ 
                              new Container(
                                padding: EdgeInsets.all(20.0),
                                child: Column( 
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,                             
                                  children: <Widget>[                                          
                                          Text("Proprietário: " + coffeesData[index].farm) 
                                      ],
                                )                                    
                              )],
                            );
  }
}
