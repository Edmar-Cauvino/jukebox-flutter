import 'package:flutter/material.dart';
import 'package:splash_ango/Login.dart';

class usuarios extends StatefulWidget {
  @override
  _usuariosState createState() => _usuariosState();
}

class _usuariosState extends State<usuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         backgroundColor:Colors.purple[300],
       title:Text("Lista", style: TextStyle(
         color:Colors.black
       ),), 
       actions: <Widget>[
         IconButton(icon: Icon(Icons.delete,color:Colors.white), onPressed: null)
       ],
     ),
   body:ListView(
     children: <Widget>[
       ListTile(
         leading: Icon(Icons.person),
         title: Text("Liam"),
        subtitle: Text("Age:20"),
   ),
   
   
   
   ],
   ),
   
   );
  }
}