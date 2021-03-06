import 'dart:io';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bandnames/models/band.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name:'Metalica', votes:4),
    Band(id: '2', name:'Steve Aoki', votes:5),
    Band(id: '3', name:'Krewella', votes:3),
    Band(id: '4', name:'Martin Garrix', votes:1),
    Band(id: '5', name:'David Gueta', votes:2),
  ];


  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
        appBar: AppBar(
          title: Text('BandNames', style: TextStyle(color: Colors.black87),),
          backgroundColor: Colors.white,
          elevation: 1
        ),
        body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (context,  i) =>  _banTile(bands[i]), 
          
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 1,
          onPressed: addNewBand, //METODO
        ),
      );
  }   

  Widget _banTile(Band band) { 
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){ 
        print('direction: $direction');
        print('id: ${band.id}');
       },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.green,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete Band', style: TextStyle(color: Colors.white) ),
        )
      ),

      child:ListTile(
            leading: CircleAvatar
            (
              child:Text(band.name.substring(0,2)),
              backgroundColor: Colors.blue[100],
            ),
            title: Text(band.name),
            trailing: Text('${band.votes}', style: TextStyle(fontSize:20)),
            onTap: (){
              print(band.name);
            },
      ),
    );
  }


  addNewBand(){

    final textController = new TextEditingController();

    if (Platform.isAndroid){
      return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('New band Name:'),
            content: TextField(
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text('Add'),
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => addBandToList(textController.text)              
              )
            ],
          );
        }      
      );
    }
    /*
    showCupertinoDialog(
      context: context,
      builder: ( _ ) {
        return CupertinoAlertDialog(
          title: Text('New Band Name'),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Add'),
              onPressed: () => addBandToList (textController.text)
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('Dismiss'),
              onPressed: () => Navigator.pop(context)
            )
          ],
        );
      }
    );*/

  }

  void addBandToList(String name){

    print(name);

    if(name.length > 1)
    {
      this.bands.add(new Band(id: DateTime.now().toString(),name: name, votes: 0));
      setState(() {
              
            });
    }
    Navigator.pop(context);
  }

}