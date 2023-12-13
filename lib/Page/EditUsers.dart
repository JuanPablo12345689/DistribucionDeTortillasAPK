import 'package:flutter/material.dart';
import 'package:Tortilleria/admin/clientesAdmin.dart';
import 'ListPage.dart';
import 'package:Tortilleria/Models/Users.dart';
import 'package:Tortilleria/Services/Firebase_CRUD.dart';
import 'package:Tortilleria/admin/repartidoresAdmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class EditUsers extends StatefulWidget {
  final QueryDocumentSnapshot user;

  EditUsers(this.user);

  @override
  _EditUsersState createState() => _EditUsersState();
}

class _EditUsersState extends State<EditUsers> {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController rolController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nombreController.text = widget.user['nombre'];
    correoController.text = widget.user['correo'];
    direccionController.text = widget.user['direccion'];
    rolController.text = widget.user['rol'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Usuario'),
        backgroundColor: const Color(0xFF0C304B),
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(16.0),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: correoController,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: direccionController,
              decoration: InputDecoration(labelText: 'Dirección'),
            ),
            DropdownButtonFormField<String>(
              value: rolController.text,
              onChanged: (newValue) {
                setState(() {
                  rolController.text = newValue!;
                });
              },
              items: ['admin', 'cliente', 'repartidor']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Rol',
              ),
            ),
            const Padding(padding: EdgeInsets.all(75)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0C304B),
                textStyle: const TextStyle(fontSize: 20),
                fixedSize: const Size(200, 50),
              ),
              onPressed: () async {
                //try {
                  if(nombreController.text.isNotEmpty && correoController.text.isNotEmpty && direccionController.text.isNotEmpty && rolController.text.isNotEmpty) {
                    usersCollection.doc(widget.user.id).update({
                      'nombre': nombreController.text,
                      'correo': correoController.text,
                      'direccion': direccionController.text,
                      'rol': rolController.text,
                    });
                    if (rolController.text == "repartidor") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RepartidoresAdmin()),
                      );
                    }
                    if (rolController.text == "cliente") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClientesAdmin()),
                      );
                    }
                  }else{
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error al Editar Usuario'),
                          content: Text('No puede haber campos vacios'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                //}catch(){}
              },
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}