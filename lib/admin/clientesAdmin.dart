import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tortilleria/Page/EditUsers.dart';
import 'package:Tortilleria/admin/agregar_userAdmin.dart';
import 'package:Tortilleria/loggin.dart';
import 'package:Tortilleria/admin/perfilAdmin.dart';
import 'package:Tortilleria/admin/pedidosAdmin.dart';
import 'package:Tortilleria/admin/repartidoresAdmin.dart';
import 'package:Tortilleria/admin/reportesAdmin.dart';
import 'package:Tortilleria/admin/inventarioAdmin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Tortilleria/Models/Users.dart';
import 'package:Tortilleria/Page/AddPage.dart';
import 'package:Tortilleria/Page/EditPage.dart';
import 'package:Tortilleria/Services/Firebase_CRUD.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'acercaDeAdmin.dart';

class ClientesAdmin extends StatefulWidget {
  const ClientesAdmin({Key? key});
  @override
  State<ClientesAdmin> createState() => _ClientesAdminState();
}

class _ClientesAdminState extends State<ClientesAdmin>{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false, //Esta linea es para ocultar el banner de debug
      title: 'Clientes',
      theme: ThemeData(primarySwatch: Colors.blue),

      home: Scaffold(
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.only(top: 20, bottom: 1),
                  child: Image.asset(
                    'images/mi_logo.png',
                    width: 300,
                    height: 300,
                  ),
                ),

                const Text("Administrador",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const Padding(padding: EdgeInsets.all(5)),

                //Ruta 1 boton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PerfilAdmin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C304B),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.blue, // Cambiar el color de fondo del botón
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(      //Quita el borde circular
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Icon(Icons.account_circle,
                          color: Colors.white), // Agregar un icono
                      SizedBox(width: 10),
                      Text(
                        'Perfil',
                        style: TextStyle(
                          color: Colors
                              .white, // Cambiar el color del texto a blanco
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                      ),
                    ],
                  ),
                ),

                const Padding(
                    padding: EdgeInsets.all(5)), //Distancia entre botones

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ClientesAdmin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF57F17),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.blue, // Cambiar el color de fondo del botón
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(      //Quita el borde circular
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      FaIcon(
                        FontAwesomeIcons.users,
                        //size: 48.0, // Tamaño del icono
                        color: Colors.white, // Color del icono
                      ), // Agregar un icono
                      SizedBox(width: 10),
                      Text(
                        'Clientes',
                        style: TextStyle(
                          color: Colors
                              .white, // Cambiar el color del texto a blanco
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AgregarUserAdmin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C304B),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.blue, // Cambiar el color de fondo del botón
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(      //Quita el borde circular
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Icon(
                        Icons.person_add,
                        color: Colors.white, //ajustar el color según tus necesidades
                      ),
                      // Agregar un icono
                      SizedBox(width: 10),
                      Text(
                        'Agregar Usuario',
                        style: TextStyle(
                          color: Colors
                              .white, // Cambiar el color del texto a blanco
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                      ),
                    ],
                  ),
                ),

                const Padding(padding: EdgeInsets.all(5)),
                //Ruta 3
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InventarioAdmin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C304B),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.blue, // Cambiar el color de fondo del botón
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(      //Quita el borde circular
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      FaIcon(
                        FontAwesomeIcons.box, // Tamaño del icono
                        color: Colors.white, // Color del icono
                      ), // Agregar un icono
                      SizedBox(width: 10),
                      Text(
                        'Inventario',
                        style: TextStyle(
                          color: Colors
                              .white, // Cambiar el color del texto a blanco
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                      ),
                    ],
                  ),
                ),

                const Padding(padding: EdgeInsets.all(5)),
                //Ruta 4
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PedidosAdmin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C304B),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.blue, // Cambiar el color de fondo del botón
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(      //Quita el borde circular
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Icon(Icons.shopping_cart,
                          color: Colors.white), // Agregar un icono
                      SizedBox(width: 10),
                      Text(
                        'Pedidos',
                        style: TextStyle(
                          color: Colors
                              .white, // Cambiar el color del texto a blanco
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                      ),
                    ],
                  ),
                ),

                const Padding(padding: EdgeInsets.all(5)),
                //Ruta 5
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RepartidoresAdmin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C304B),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.blue, // Cambiar el color de fondo del botón
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(      //Quita el borde circular
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Icon(Icons.delivery_dining,
                          color: Colors.white), // Agregar un icono
                      SizedBox(width: 10),
                      Text(
                        'Repartidores',
                        style: TextStyle(
                          color: Colors
                              .white, // Cambiar el color del texto a blanco
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                      ),
                    ],
                  ),
                ),

                const Padding(padding: EdgeInsets.all(5)),
                //Ruta 6
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ReportesAdmin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C304B),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.blue, // Cambiar el color de fondo del botón
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(      //Quita el borde circular
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      FaIcon(
                        FontAwesomeIcons.fileAlt,  // Icono de "reportes"
                        color: Colors.white,  // Color del icono
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Reportes',
                        style: TextStyle(
                          color: Colors
                              .white, // Cambiar el color del texto a blanco
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                      ),
                    ],
                  ),
                ),

                const Padding(
                    padding: EdgeInsets.all(5)), //Distancia entre botones
                //Ruta 2 boton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const aboutAdmin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C304B),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.blue, // Cambiar el color de fondo del botón
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(
                      //Quita el borde circular
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.white,
                      ),// Agregar un icono
                      SizedBox(width: 10),
                      Text(
                        'Acerca de',
                        style: TextStyle(
                          color: Colors
                              .white, // Cambiar el color del texto a blanco
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                      ),
                    ],
                  ),
                ),
                //Ruta 7


                const Padding(padding: EdgeInsets.all(5)),
                //Salir
                ElevatedButton(
                  onPressed: () {
                    // Coloca aquí la lógica para salir de la aplicación
                    //SystemNavigator.pop();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Loggin()),
                          (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(      //Quita el borde circular
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    'Cerrar Sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0C304B),
          title: const Text('Tortillería'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('users').where('rol', isEqualTo: 'cliente').snapshots(),

          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text('No hay usuarios disponibles.');
            } else {
              final users = snapshot.data!.docs;
              return ListView.builder(
                //itemCount: snapshot.data!.docs.length,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final nombre = user['nombre'] ??'';
                  final correo = user['correo'];
                  final direccion = user['direccion'];
                  final rol = user['rol'];
                  var UID = user.id;
                  /*return ListTile(
                    title: Text('Nombre: ${userData['nombre']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Correo: ${userData['correo']}'),
                        Text('Dirección: ${userData['direccion']}'),
                        Text('Rol: ${userData['rol']}'),
                      ],
                    ),
                  );*/
                  //Aqui empieza algo chido
                  return Card(child: Column(
                    children: [
                      ListTile(
                        //title: Text('Nombre: ${userData['nombre']}'),
                        title: Text('Nombre: ${nombre}'),
                        subtitle: Container(
                          child: (Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Correo: ${correo}',
                                  style: const TextStyle(fontSize: 14)
                              ),
                              Text('Dirección: ${direccion}',
                                  style: const TextStyle(fontSize: 12)
                              ),
                              Text('Rol: ${rol}',
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
                          ElevatedButton
                            (style: ElevatedButton.styleFrom(
                            primary: Colors.red, // Cambia el color de fondo aquí
                            onPrimary: Colors.white, // Cambia el color del texto aquí
                            textStyle: const TextStyle(fontSize: 20),
                            padding: const EdgeInsets.all(5.0),
                          ),
                            child: const Text("Eliminar"),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Confirmar Eliminación'),
                                    content: Text('¿Estás seguro de que deseas eliminar esta cuenta?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                          try {
                                            final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
                                              'requestDeleteAccount',
                                              options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
                                            );
                                            final result = await callable.call({'uid': UID});
                                            print(result.data);
                                          } catch (e) {
                                            print('Error al solicitar la eliminación de la cuenta: $e');
                                          }
                                        },
                                        child: Text('Confirmar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          ElevatedButton
                            (style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(5.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                            child: const Text("Editar"),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => EditUsers(
                                      user
                                  ),
                                ),
                              );
                            },
                          ),
                          /*TextButton(
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
                          ),*/
                        ],
                      ),
                    ],
                  ),
                  );
                  //Aqui termina algo chido
                },
              );
            }
          },
        ),
      ),
    );
  }
}
