
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Tortilleria/Models/Response.dart';
import 'package:flutter/cupertino.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('users');

class FirebaseCRUD {
  //Los metodos del CRUD irán aquí
  static Future<Response> add_User ({
    required String nombre,
    required String correo,
    required String direccion,
    required String rol
})async{
    Response response = Response();
    DocumentReference documentReference = _Collection.doc();
    Map<String,dynamic> Data=<String,dynamic>{
      //Hacer referencia a los campos que creamos en la base de datos
      //Primero entre comillas como esta en la base despues de los puntos hacemos referencia
      "nombre":nombre,
      "correo":correo,
      "direccion":direccion,
      "rol":rol,
    };
    var result = await documentReference
    //Tiempo de respesta en mmilisegundos con respecto al código
    .set(Data)
    .whenComplete((){
      response.Code = 200;
      response.Message = "Se ha insertado correctamente en la BD";
    })
    .catchError((e) {
      response.Code = 500;
      response.Message = e;
    });
    return response;
  }

  //Operecion READ_EMPLOYEE
  //Stream: clase para la consulta de captura de registros
static Stream<QuerySnapshot> ReadUsers(){
    CollectionReference notesItemCollection = _Collection;
    return notesItemCollection.snapshots();
}

//Operacion de actualizar (UPDATE), UPDATE_Employee
  static Future<Response> UpdateUsers({
    required String nombre,
    required String correo,
    required String direccion,
    required String rol,
    required String DocId
}) async{
    Response response = Response();
    DocumentReference documentReference = _Collection.doc(DocId);
    Map<String,dynamic> Data=<String,dynamic>{
      //Hacer referencia a los campos que creamos en la base de datos
      //Primero entre comillas como esta en la base despues de los puntos hacemos referencia
      "nombre":nombre,
      "correo":correo,
      "direccion":direccion,
      "rol":rol,
    };
    await documentReference
    .update(Data)
    .whenComplete((){
      response.Code = 200;
      response.Message = "Actualización exitosa en la BD";
    }).catchError((e) {
      response.Code = 500;
      response.Message = e;
    });
    return response;
    //Operacion DELETE_Employee

  }
  static Future<Response> DeleteEmployee({
    required String DocId,
  }) async {
    Response response = Response();
    DocumentReference documentReference = _Collection.doc(DocId);
    await documentReference
    .delete()
        .whenComplete((){
      response.Code = 200;
      response.Message = "Borrado exitoso en la BD";
    }).catchError((e) {
      response.Code = 500;
      response.Message = e;
    });
    return response;
  }
}