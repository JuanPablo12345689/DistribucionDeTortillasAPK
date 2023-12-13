//Formulario para agregar detalles de empleado
import 'package:flutter/material.dart';
import 'listPage.dart';
import 'package:Tortilleria/Services/Firebase_CRUD.dart';

class AddPage extends StatefulWidget{
  State<StatefulWidget> createState(){
    return _AddPage();
  }
}
class _AddPage extends State<AddPage>{
  final _user_nombre = TextEditingController();
  final _user_correo = TextEditingController();
  final _user_direccion = TextEditingController();
  final _user_rol = TextEditingController();
  //Indentificar elementos de forma unica.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
@override
  Widget build(BuildContext context){
    final nameField = TextFormField(
      controller: _user_nombre,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return "Este campo es requerido, asi que llenalo";
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 15.0),
        hintText: "Nombre",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final correoField = TextFormField(
      controller: _user_correo,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return "Este campo es requerido, asi que llenalo";
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 15.0),
        hintText: "Correo",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final direccionField = TextFormField(
      controller: _user_direccion,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return "Este campo es requerido, asi que llenalo";
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 15.0),
        hintText: "Dirección",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final rolField = TextFormField(
      controller: _user_rol,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return "Este campo es requerido, asi que llenalo";
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 15.0),
        hintText: "Role",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    final ViewListButton = TextButton(onPressed: (){
      Navigator.pushAndRemoveUntil<dynamic>(context, MaterialPageRoute<dynamic>(builder: (BuildContext context)=> ListPage()
      ),
        (Route)=>false);
    },
    child: const Text("Ver lista de Usuarios"));

    final saveButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: ()async{
          if(_formKey.currentState !.validate()){
            var response = await FirebaseCRUD.add_User(
                nombre: _user_nombre.text,
                correo: _user_correo.text,
                direccion: _user_direccion.text,
                rol: _user_rol.text
            );
            if(response.Code != 200){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  content: Text(response.Message.toString()),
                );
              });
            }
            else{
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  content: Text(response.Message.toString()),
                );
              });
            }
          }
        },
        child: Text(
          "Guardar",
          style: TextStyle(
            color: Theme.of(context).primaryColorLight
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("CRUD FireStore"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                nameField,
                const SizedBox(height: 25.0),
                correoField,
                const SizedBox(height: 35.0),
                direccionField,
                const SizedBox(height: 35.0),
                rolField,
                ViewListButton,
                const SizedBox(height: 45.0),
                saveButton,
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}