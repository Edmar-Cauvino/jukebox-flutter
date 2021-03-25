import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:splash_ango/Editar.dart';
import 'package:splash_ango/variavel.dart';
import 'package:splash_ango/Login.dart';
import 'package:splash_ango/cadastro.dart';
import 'package:dio/dio.dart';

  var _id;
  var nome;
  var email;
  var dataNascimento;

class Listagem extends StatefulWidget {
  @override
  _ListagemState createState() => _ListagemState();
}



class User {
  final String _id;
  final String nome;
  final String email;
  final String dataNascimento;

  User(this._id, this.nome, this.email, this.dataNascimento);
}

 Future <List<User>> _getListApi() async {
    Response response;
    //
    BaseOptions options = new BaseOptions(
        baseUrl: "https://crudcrud.com/api/"+apiKeyHas,
        connectTimeout: 5000,
        receiveTimeout: 3000,
    );

    Dio dio = new Dio(options);
    response = await dio.get("/users", options: Options(contentType:Headers.formUrlEncodedContentType ));

    print(response.data.toString());
    /*var response = await http.get(request);
    var dadosJson = json.decode(response.body);*/
    //var dados;
    //dados = jsonDecode(response.data.toString());

    List <User> users = [];

    for(var u in response.data){
      
      User user = User(u["_id"] ?? 'id', u["nome"] ?? 'Edmar', u["email"] ?? 'edmar@gmail.com', u["data_nascimento"] ?? '22/01/2000');

      users.add(user);
    }

    return users;
  }

  ListTile _contactCard({String Id, String Title, String Subtitle, String dataNascimento }) {
    return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://i.pinimg.com/280x280_RS/10/f7/ea/10f7ea82662e5b0cedb6573279308b81.jpg"),
          ),

          title: Text(Title, 
                        style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold)
                      ),
          
          subtitle: Container(
            child: Text(
            Subtitle +' \n '+ dataNascimento,
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
            
          ),
          ),

          trailing: Container(
            width: 100,
            child: Row(
              children: <Widget>[ 
                    
                      IconButton(icon: Icon(Icons.edit, size: 15, color: Colors.orange,),  onPressed: (){ 
                       return Editar();
                      }),
                      
                      IconButton(icon: Icon(Icons.delete,size: 15, color: Colors.red,), onPressed: (){ 
                            
                              return AlertDialog(
                                title: Text('Alerta'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                            Text("Tem certeza que deseja apagar este usuário?")                 
                                      
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    child: Text('Não'),
                                    onPressed: () {
                                      //Navigator.of(context).pop();
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text('Sim'),
                                    onPressed: () {
                                      //Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            
                        
                      }
                      ),
                    ],
            ) 
          ),
          
      onTap: () {
        

      },
      
    );
    
  }



class _ListagemState extends State<Listagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.purple[300],
       actions: <Widget>[
         IconButton(icon: Icon(Icons.power_settings_new), onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => login()));
            })
       ],
       centerTitle: true,
       title:Text("Lista dos usuários", style: 
       TextStyle(
         color:Colors.black
       ),
       
       ),
       
       
     ),
   body:
   Container(
          child:
          FutureBuilder<List<User>>(
            future: _getListApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot){

              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child:Text("Carregando" , style: TextStyle(
                      fontSize: 30
                    ),),
                  ),
                );
              }else{

                return ListView.builder(
                        padding: EdgeInsets.all(10.0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index){

                            _id = snapshot.data[index]._id;
                            nome = snapshot.data[index].nome;
                            email = snapshot.data[index].email;
                            dataNascimento  = snapshot.data[index].dataNascimento;
                          return _contactCard(Id: _id, Title: nome, Subtitle: email, dataNascimento: dataNascimento);

                          }
                      );
                
                

              }

            },

          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => cadastro()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[300],

      ),
     
    
       


   );
  }

  
  
}

/*  Widget _contactCard(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 50.0,
                 height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  /*image: DecorationImage(
                      image: contacts[index].img != null ?
                          FileImage(File(contacts[index].img)) :
                          AssetImage("images/person.png")
                  ),*/
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row( children: <Widget>[
                      Text("Edmar Cauvino",
                      style: TextStyle(fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      ),
                      IconButton(icon: Icon(Icons.edit), onPressed: (){ 
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Editar()));
                      }),
                      IconButton(icon: Icon(Icons.delete), onPressed: (){ 
                       /* return _AlertDialogDelete();*/
                      }),
                    ],
                    ),
                    Text("cauvinoaraujo22@gmail.com",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text("10.05.1995",
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
     onTap: (){
      //_showContactPage(contact: contacts[index]);
}

);  



}*/



    
 