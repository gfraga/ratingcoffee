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
      body: new ListView.separated(
                            separatorBuilder: (BuildContext context, int index) => Divider(height: 10.0,),
                            itemBuilder: (BuildContext context, int index) =>                                                        
                            ListTile(
                              leading: Icon(Icons.dns),
                              title: Text(widget.coffeesData[index].name),
                              subtitle: Text(widget.coffeesData[index].farm),                              
                            ),
                            itemCount: widget.coffeesData.length
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
}
