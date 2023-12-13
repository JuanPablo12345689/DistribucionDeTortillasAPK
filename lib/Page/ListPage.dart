//mostrar la lista de empleados
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Tortilleria/Models/Users.dart';
import 'package:Tortilleria/Page/AddPage.dart';
import 'package:Tortilleria/Page/EditPage.dart';
import 'package:flutter/material.dart';
import 'package:Tortilleria/Services/Firebase_CRUD.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCRUD.ReadUsers();
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Lista de Empleados"),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.app_registration,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil<dynamic>(context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => AddPage(),

                  ),
                      (route) => false);
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _users.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
          if (snapshot!.hasData) {
            return Padding(padding: const EdgeInsets.only(top: 8.0),
                child: ListView(
                  children: snapshot.data!.docs.map((e) {
                    return Card(child: Column(
                      children: [
                        ListTile(
                          title: Text(e["nombre"]),
                          subtitle: Container(
                            child: (Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Correo: " + e['correo'],
                                    style: const TextStyle(fontSize: 14)
                                ),
                                Text("Dirección: " + e["direccion"],
                                    style: const TextStyle(fontSize: 12)
                                ),
                                Text("Role: " + e["rol"],
                                    style: const TextStyle(fontSize: 12)
                                ),
                              ],
                            )
                            ),
                          ),
                    ),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              /*TextButton
                                (style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(5.0),
                                primary: const Color.fromARGB(
                                    255, 143, 133, 226),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                                  child: const Text("Editar"),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) =>
                                              EditPage(
                                                users: Users(
                                                  Uid: e.id,
                                                  nombre: e["nombre"],
                                                  correo: e["correo"],
                                                  direccion: e["direccion"],
                                                  rol: e["rol"],
                                                ),
                                              ),
                                        ),
                                            (route) => false);
                                  },
                              ),*/
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(5.0),
                                  primary: const Color.fromARGB(255, 143, 133, 226),
                                  textStyle: const TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                    child: const Text("Borrar"),
                                    onPressed: () async {
                                        var response =
                                        await FirebaseCRUD.DeleteEmployee(DocId: e.id);
                                        if(response.Code != 200){
                                          showDialog(
                                            context: context, builder: (context){
                                            return  AlertDialog(content: Text(response.Message.toString())
                                          );
                                        });
                                    }
                                  },
                              ),
                            ],
                          ),
                      ],
                    ),
                    );
                  },
                  ).toList(),
                )
            );
          }
          return Container();
        },
      ),
    );
  }
}