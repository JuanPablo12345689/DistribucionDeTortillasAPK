import 'package:Tortilleria/cliente/acercaDe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tortilleria/cliente/menuCli.dart';
import 'package:Tortilleria/loggin.dart';
import 'package:Tortilleria/main.dart';
import 'package:Tortilleria/cliente/perfilCli.dart';
import 'package:Tortilleria/cliente/pedidosCli.dart';
import 'package:Tortilleria/cliente/perfilCli.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class PerfilCli extends StatefulWidget {
  const PerfilCli({Key? key});
  @override
  State<PerfilCli> createState() => _PerfilCliState();
  static String nombre ="hola";
  static nombres() {
    return nombre;
  }

}

class _PerfilCliState extends State<PerfilCli>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  String? direccion;
  String nombre = PerfilCli.nombres();

  User? _currentUser;
  @override
  void initState() {
    super.initState();
    // Verificar si el usuario ha iniciado sesión.
    _currentUser = _auth.currentUser;
    direccion;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Esta linea es para ocultar el banner de debug
      title: 'Perfil',
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

                const Text("Perfil del Cliente",
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
                      MaterialPageRoute(builder: (context) => const PerfilCli()),
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
                      MaterialPageRoute(builder: (context) => const PedidosCli()),
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
                          builder: (context) => const aboutCli()),
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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: _currentUser != null
              ? Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: _firestore.collection('users').doc(_currentUser!.uid).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      //var userData = snapshot.data!.data() as Map<String, dynamic>;
                      var userData = snapshot.data!.data();
                      nombre = userData?['nombre'];
                      direccion = userData?['direccion'];
                      /*return Column(
                        children: [
                          Text('Nombre: ${userData['nombre']}'),
                          Text('Correo: ${_currentUser!.email}'),
                          Text('Dirección: ${userData['direccion']}'),
                          Text('Rol: ${userData['rol']}'),
                        ],
                      );*/
                      //Aqui emepizas algo perro
                      return Card(child: Column(
                        children: [
                          ListTile(
                            title: Text('Nombre: ${userData?['nombre']}',
                                style: const TextStyle(fontSize: 18)
                            ),
                            subtitle: Container(
                              child: (Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Correo: ${_currentUser!.email}',
                                      style: const TextStyle(fontSize: 14)
                                  ),
                                  Text('Dirección: ${userData?['direccion']}',
                                      style: const TextStyle(fontSize: 12)
                                  ),
                                  Text('Dirección: ${nombre}',
                                      style: const TextStyle(fontSize: 12)
                                  ),
                                  Text('Rol: ${userData?['rol']}',
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
                      //Aqui termina algo perro
                    }
                  }
                  return CircularProgressIndicator();
                },
              ),
              const Padding(padding: EdgeInsets.all(30)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Correo Electrónico'),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _direccionController,
                  decoration: InputDecoration(labelText: 'Dirección'),
                ),
              ),
              /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Nueva Contraseña'),
                  obscureText: true,
                ),
              ),*/
              const Padding(padding: EdgeInsets.all(30)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C304B),
                  textStyle: const TextStyle(fontSize: 20),
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () async {
                  await updateProfile();
                },
                child: Text('Actualizar Perfil'),
              ),
            ],
          )
              : Text('Usuario no logueado'),
        ),
      ),
    );
  }
  Future<void> updateProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Actualizar el correo electrónico del usuario.
        /*await user.updateEmail(_emailController.text);
        // Actualizar la contraseña del usuario.
        await user.updatePassword(_passwordController.text);*/

        // Actualizar los datos en la colección "users" en Firestore.
        if(_nameController.text.isNotEmpty){
          await _firestore.collection('users').doc(user.uid).update({
            'nombre': _nameController.text
          });

        }
        if(_direccionController.text.isNotEmpty){
          await _firestore.collection('users').doc(user.uid).update({
            'direccion': _direccionController.text
          });

        }
        if(_direccionController.text.isEmpty && _nameController.text.isEmpty){
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error al Actualizar Perfil'),
                content: Text('Hay campos vacios'),
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
        // Mostrar un mensaje de éxito.
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Perfil actualizado con éxito'),
        ));
      } else {
        // El usuario no está autenticado.
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('El usuario no está autenticado'),
        ));
      }
    } catch (error) {
      // Manejo de errores.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $error'),
      ));
    }
  }
}
