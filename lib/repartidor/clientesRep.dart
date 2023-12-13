import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tortilleria/loggin.dart';
import 'package:Tortilleria/main.dart';
import 'package:Tortilleria/repartidor/pedidosRep.dart';
import 'package:Tortilleria/repartidor/perfilRep.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'acercaDeRep.dart';

class clientesRep extends StatefulWidget {
  const clientesRep({Key? key});
  @override
  State<clientesRep> createState() => _clientesRepState();
}

class _clientesRepState extends State<clientesRep>{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Esta linea es para ocultar el banner de debug
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.blue),

      home: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.white,
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

                const Text("Perfil del Repartidor",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const Padding(padding: EdgeInsets.all(5)),

                //Ruta 1 boton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PerfilRep()),
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
                const Padding(padding: EdgeInsets.all(5)),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const clientesRep()),
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
                      ),
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

                const Padding(
                    padding: EdgeInsets.all(5)), //Distancia entre botones
                //Ruta 2 boton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PedidosRep()),
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
                const Padding(
                    padding: EdgeInsets.all(5)), //Distancia entre botones
                //Ruta 2 boton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const aboutRep()),
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
                //const Padding(padding: EdgeInsets.all(155)),

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
                  final nombre = user['nombre'];
                  final correo = user['correo'];
                  final direccion = user['direccion'];
                  final rol = user['rol'];
                  DocumentSnapshot document = snapshot.data!.docs[index];
                  var userData = document.data() as Map<String, dynamic>;
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
