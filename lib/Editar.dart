import 'package:flutter/material.dart';
import 'package:splash_ango/Listagem.dart';
import 'package:splash_ango/Login.dart';
import 'package:splash_ango/cadastro.dart';

class Editar extends StatefulWidget {
  @override
  _EditarState createState() => _EditarState();
}
 



class _EditarState extends State<Editar> { 

 String _name;
 String _email;
 String _datadenascimento;
 String _senha;
 String _senhaNova;

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
  return TextFormField(
    decoration:InputDecoration( labelText:"Name"),
    validator:(String value){
      if(value.isEmpty){
        return "Digite seu nome";
      }
      
    },
onSaved: (String value) {
  _name = value;
}
       
       
  );
}
Widget _buildEmail(){
  return TextFormField(
    decoration:InputDecoration( labelText:"Email"),
    validator:(String value){
      if(value.isEmpty){
        return "Digite seu email";
      }
      
    },
onSaved: (String value) {
  _email = value;
}
       
       
  );
}
Widget _builddatadenascimento(){
  return TextFormField(
    decoration:InputDecoration( labelText:"Data de nascimento"),
    initialValue: "${selectedDate.toLocal()}".split(' ')[0],
    validator:(String value){
      if(value.isEmpty){
        return "Digite sua data de nascimento";
      }  
    },
    onTap:  () => _selectDate(context),
    
onSaved: (String value) {
  _datadenascimento = value;
}
       
       
  );
}
Widget _buildSenha(){
  return TextFormField(
    decoration:InputDecoration( labelText:"Senha antiga"),
    validator:(String value){
      if(value.isEmpty){
        return "Digite sua senha";
      }
      
    },
    onSaved: (String value) {
      _senha = value;
    }   
  );
}

Widget _buildSenhaNova(){
  return TextFormField(
    decoration:InputDecoration( labelText:"Senha nova"),
    validator:(String value){
      if(value.isEmpty){
        return "Digite sua senha";
      }
      
    },
    onSaved: (String value) {
      _senha = value;
    }   
  );
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[300],
        title:Text("Editar",style: TextStyle(
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
        padding:  EdgeInsets.only(top: 10),
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
       
        _buildName(),
        _buildEmail(),
        _builddatadenascimento(),
        SizedBox(
          height:100,
        ),
        RaisedButton(
          child: Text("Alterar senha", style: TextStyle(
            color:Colors.black
          ),),
          onPressed: (){
              return _AlertDialog();
            if (!_formkey.currentState.validate()){
          
            }
            _formkey.currentState.save();
            print(_name);
             print(_email);
              print(_selectDate);
               print(_senha);

          },

        ),
         RaisedButton(
          child: Text("Editar", style: TextStyle(
            color:Colors.black
          ),),
          onPressed: (){
            
            if (!_formkey.currentState.validate()){
            }
            _formkey.currentState.save();
            print(_name);
             print(_email);
              print(_selectDate);
               print(_senha);

          },

        ),
      ],
          ) ,
          )
      ),
      
    );
  }



  Future<void> _AlertDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alterar senha'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              _buildSenha(),
              _buildSenhaNova(),                         
              
            ],
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          RaisedButton(
            child: Text('Salvar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}

