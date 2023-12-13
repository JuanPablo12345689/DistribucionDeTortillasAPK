//Editar los datos de los empleados
import 'package:flutter/material.dart';
import 'ListPage.dart';
import 'package:Tortilleria/Models/Users.dart';
import 'package:Tortilleria/Services/Firebase_CRUD.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class EditPage extends StatefulWidget{
  final QueryDocumentSnapshot user;
  EditPage(this.user);
  State<StatefulWidget> createState(){
    return _EditPage();
  }
}
class _EditPage extends State<EditPage>{
  final _user_nombre = TextEditingController();
  final _user_correo = TextEditingController();
  final _user_direccion = TextEditingController();
  final _user_rol = TextEditingController();
  final _docId = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void initState(){
    super.initState();
    _docId.value = TextEditingValue(text: widget.user['']);
    _user_nombre.value = TextEditingValue(text: widget.user['nombre']);
    _user_correo.value = TextEditingValue(text: widget.user['correo']);
    _user_direccion.value = TextEditingValue(text: widget.user['direccion']);
    _user_rol.value = TextEditingValue(text: widget.user['rol']);

  }

  @override
  Widget build(BuildContext context){
    final docIdField = TextField(
      controller: _docId,
      readOnly: true,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "ID",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final nameField = TextFormField(
      controller: _user_nombre,
      autofocus: false,
      validator: (value){
        if (value == null || value.trim().isEmpty){
          return "Este campo es requerido";
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
        if (value == null || value.trim().isEmpty){
          return "Este campo es requerido";
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Correo",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),

        ),
      ),
    );
    final direccionField = TextFormField(
      controller: _user_direccion,
      autofocus: false,
      validator: (value){
        if (value == null || value.trim().isEmpty){
          return "Este campo es requerido";
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Dirección",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final rolField = TextFormField(
      controller: _user_rol,
      autofocus: false,
      validator: (value){
        if (value == null || value.trim().isEmpty){
          return "Este campo es requerido";
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Role",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final ViewListButton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => ListPage(),
              ),
                  (route) => false);
        },
        child: const Text("Ver lista de empleados"),
    );
    final saveButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()){
            var response = await FirebaseCRUD.UpdateUsers(
                nombre: _user_nombre.text,
                correo: _user_correo.text,
                direccion: _user_direccion.text,
                rol: _user_rol.text,
                DocId: _docId.text);
            if(response.Code != 200){
              showDialog(
                  context: context, builder: (context){
                return  AlertDialog(content: Text(response.Message.toString())
                );
              });
            }else{
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  content: Text(response.Message.toString()),
                );
              });
            }
          }
        },
        child: Text("Actualizar",
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  docIdField,
                  const SizedBox(
                    height: 25.0,
                  ),
                  nameField,
                  const SizedBox(
                    height: 25.0,
                  ),
                  correoField,
                  const SizedBox(
                    height: 35.0,
                  ),
                  direccionField,
                  const SizedBox(
                    height: 35.0,
                  ),
                  rolField,
                  const SizedBox(
                    height: 35.0,
                  ),
                  ViewListButton,
                  const SizedBox(
                    height: 45.0,
                  ),
                  saveButton,
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}