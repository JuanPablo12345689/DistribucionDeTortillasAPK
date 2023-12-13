import 'package:Tortilleria/cliente/menuCli.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tortilleria/loggin.dart';
import 'package:Tortilleria/main.dart';
import 'package:Tortilleria/cliente/perfilCli.dart';
import 'package:Tortilleria/cliente/pedidosCli.dart';
import 'package:Tortilleria/cliente/perfilCli.dart';
import 'package:Tortilleria/Models/Pedido.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class aboutCli extends StatefulWidget {
  const aboutCli({Key? key});
  @override
  State<aboutCli> createState() => _aboutCliState();
}

class _aboutCliState extends State<aboutCli> {


  void initState() {
    super.initState();
    // Verificar si el usuario ha iniciado sesión.
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
      false, //Esta linea es para ocultar el banner de debug
      title: 'Realizar Pedido',
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

                const Text("Cliente",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const Padding(padding: EdgeInsets.all(5)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuCli()),
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
                      Icon(Icons.menu_book_sharp,
                          color: Colors.white), // Agregar un icono
                      SizedBox(width: 10),
                      Text(
                        'Realizar Pedido',
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
                //Ruta 1 boton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PerfilCli()),
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
                //Ruta 2 boton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PedidosCli()),
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
                          builder: (context) => const aboutCli()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF57F17),
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



                /* ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalificarCli()),
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
                      Icon(Icons.rate_review,
                          color: Colors.white), // Agregar un icono
                      SizedBox(width: 10),
                      Text(
                        'Opinar',
                        style: TextStyle(
                          color: Colors
                              .white, // Cambiar el color del texto a blanco
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                      ),
                    ],
                  ),
                ),*/

                const Padding(padding: EdgeInsets.all(5)),

                //const Padding(padding: EdgeInsets.all(160)),
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
                    shape: const RoundedRectangleBorder(
                      //Quita el borde circular
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tortillería La Esperanza',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Somos una tortillería comprometida con la calidad y tradición. '
                    'Nuestro compromiso es ofrecer las mejores tortillas a nuestros clientes.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '¡Gracias por elegir La Tortillería La Esperanza!',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Divider(), // Línea divisoria para separar la información de contacto
              SizedBox(height: 10),
              Text(
                'Se proporciona información de contacto y se anima a los usuarios a reportar cualquier problema.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Información de contacto del desarrollador:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Desarrollador: Juan Pablo'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Correo electrónico: pabloperezm988@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Teléfono: +52 413 116 85 03'),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
