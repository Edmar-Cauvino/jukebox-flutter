import 'package:flutter/material.dart';
import 'package:splash_ango/Listagem.dart';
import 'package:splash_ango/Login.dart';
import 'package:splash_ango/variavel.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class cadastro extends StatefulWidget {
  @override
  _cadastroState createState() => _cadastroState();
}
 
class User {
  final int id;
  final String nome;
  final String email;
  final String dataNascimento;

  User(this.id, this.nome, this.email, this.dataNascimento);
}

Future <List<User>> _postUserApi(String nome, String email, String dataNascimento, String senha) async {
  Response response;
  //
  BaseOptions options = new BaseOptions(
      baseUrl: "https://crudcrud.com/api/"+apiKeyHas,
      connectTimeout: 5000,
      receiveTimeout: 3000,
  );

  Dio dio = new Dio(options);
  response = await dio.post("/users",
    data: { "nome": nome, "email": email, "data_nascimento": dataNascimento, "senha": senha} 
  );

  print(response.data.toString());
  print("Sucesso...");
  /*var response = await http.get(request);
  var dadosJson = json.decode(response.body);*/

  List <User> users = [];

  /*for(var u in dadosJson["resultado"]){
    User user = User(u["id"], u["inst"], u["assunto"], u["cod"], u["foto"]);

    users.add(user);
  }*/

  return users;
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}


class _cadastroState extends State<cadastro> { 

  //final datanascimentoControllerController = TextEditingController(text: "Your initial value");

  void initState() {
    //TextEditingController nomeController = new TextEditingController();
    
    //ageController = TextEditingController(text: widget.student.age.toString());
    super.initState();
  }

  //bool _autoValidate = false;

 TextEditingController nomeController =  TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController datanascimentoController = TextEditingController();
 TextEditingController senhaController = TextEditingController();

DateTime selectedDate = DateTime.now();

Future<void> _selectDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950, 8),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate)
    setState(() {
      selectedDate = picked;
    });
}


final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

Widget _buildName(){
  return TextField(
    decoration:InputDecoration( labelText:"Name"),
    controller: nomeController,

       
       
  );
}
Widget _buildEmail(){
  return TextField(
    decoration:InputDecoration( labelText:"Email"),
    controller: emailController,
       
       
  );
}
Widget _builddatadenascimento(){
  return TextField(
    controller: datanascimentoController,
    decoration:InputDecoration( labelText:"Data de nascimento"),  
       
       
  );
  
}

Widget _buildSenha(){
  return TextField(
    decoration:InputDecoration( labelText:"Senha"),
    
controller: senhaController,
       
       
  );
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[300],
        title:Text("Cadastro",style: TextStyle(
          color:Colors.black,
        ),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.power_settings_new), onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => login()));
            })
        ],
      ),
      
      body: Container(
        padding:  EdgeInsets.only(top: 2),
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Text("Faça o seu Cadastro!", style: TextStyle(
          fontSize: 25,
        ),),
        _buildName(),
        _buildEmail(),
        _builddatadenascimento(),
        _buildSenha(),
        SizedBox(
          height:100,
        ),
        RaisedButton(
          child: Text("Cadastrar-se", style: TextStyle(
            color:Colors.black
          ),),
          onPressed: (){
            
            String md5Password = generateMd5(senhaController.text);
            
            _postUserApi(nomeController.text, emailController.text, '21-01-2000', md5Password);
            
            Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => Listagem())
            
            );
            

          },

        )
      ],
          ) ,
          )
      ),
      
    );
  }
}