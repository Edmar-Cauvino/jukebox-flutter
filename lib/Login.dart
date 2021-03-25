import 'package:flutter/material.dart';
import 'package:splash_ango/Listagem.dart';

import 'package:splash_ango/variavel.dart';

import 'package:dio/dio.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}








class _loginState extends State<login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool _autoValidate = false;

  /*bool _getPostLoginApi(String userEmail, String userSenha) async{
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
      
      for(var u in response.data){

        if(u["email"] == userEmail && u["senha"] == userSenha){
          return true;
        }
        
        
      }

      return false;

}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("images/vetor.jpeg"),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Bem vindo á sua conta ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 20.0),

                      // TextFormField for email address

                       TextFormField(
                        autofocus: false,
                        controller: _emailController,
                        validator: validateEmail,
                        onSaved: (value) => _email = value,
                        style: style,
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            hintText: "Digite seu email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),

                      SizedBox(height: 20.0),

                      // TextFormField for email address

                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        controller: _passwordController,
                        validator: validatePassword,
                        onSaved: (value) => _password = value,
                        style: style,
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            hintText: "Digite sua senha",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),

                      SizedBox(height: 20.0),
                      Material(
                        // login button
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.redAccent,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          onPressed: () {
                            /*if (_formKey.currentState.validate()) {

                              //bool isExist = _getPostLoginApi(_emailController.text, _passwordController.text);
                              //print(isExist);
                             /* if(_emailController.text == 'teste@gmail.com' && _passwordController.text == 'test2021'){
                                
                              }else{
                                AlertDialog(
                                  title: Text('Email ou senha errada'),
                                );
                              }*/
                             

                            } else {
                              setState(() {
                                // validation error
                                _autoValidate = true;
                              });
                            }*/

                             Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Listagem()));
                            
                            
                          },
                          child: Text("Entrar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                      ),
                      SizedBox(height: 33.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                        
                          Text("Jukebox",style: TextStyle(color: Colors.amber[600],
                              fontSize:50, fontWeight: FontWeight.bold
                          ),
                          ),
                          
                        ],
                      ),
                      
                      Text("A G E N C I A M E N T O",style: TextStyle(color: Colors.brown[100],
                              fontSize:15, fontWeight: FontWeight.bold
                          ),


                          ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String validatePassword(String value) {
  Pattern pattern = r'^(?=.?[a-z])(?=.?[0-9]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (value.length == 0) {
    return "A sua senha por favor";
  } 
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (value.length == 0) {
    return "Digite o email";
  } else if (!regex.hasMatch(value))
    return 'Insira um email válido';
  else
    return null;
}

