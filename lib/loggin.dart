import 'package:Tortilleria/admin/perfilAdmin.dart';
import 'package:Tortilleria/cliente/perfilCli.dart';
import 'package:Tortilleria/repartidor/perfilRep.dart';
import 'package:flutter/material.dart';
import 'package:Tortilleria/admin/menuAdmin.dart';
import 'package:Tortilleria/cliente/menuCli.dart';
import 'package:Tortilleria/repartidor/menuRep.dart';
import 'package:Tortilleria/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Tortilleria/recuperar_password.dart';

class Loggin extends StatefulWidget {
  const Loggin({Key? key});

  @override
  State<Loggin> createState() => _LogginState();
}

class _LogginState extends State<Loggin> {
  String _errorText = '';
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(50)),
              Text(
                "Inicio Sesión",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Padding(padding: EdgeInsets.all(20)),

              TextField(
                onChanged: (value) {
                  email = value;
                },
                //controller: usuarioController,
                decoration: InputDecoration(
                  labelText: "Usuario",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),

              const Padding(padding: EdgeInsets.all(5)),

              TextField(
                onChanged: (value) {
                  password = value;
                },
                //controller: contrasenaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),

              const Padding(padding: EdgeInsets.all(30)),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C304B),
                  textStyle: const TextStyle(fontSize: 20),
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () async {
                  User? user = await signInWithEmailAndPassword(context,
                     email ?? '', password ?? '');
                  if (user != null) {
                    // Obtener el rol del usuario actual
                    String? userRole = await getUserRole(user.uid);

                    if (userRole == 'admin') {
                      // Navegar a la pantalla de administrador
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PerfilAdmin(),
                      ));
                    } else if (userRole == 'cliente') {
                      // Navegar a la pantalla de cliente
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PerfilCli(),
                      ));
                    } else if (userRole == 'repartidor') {
                      // Navegar a la pantalla de repartidor
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PerfilRep(),
                      ));
                    }
                  }
                },
                child: Text("Iniciar Sesión"),
              ),

              const Padding(padding: EdgeInsets.all(15)),

              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
                child: Text(
                  '¿Aún no estas Registrado?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              const Padding(padding: EdgeInsets.all(5)),

              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PasswordUpdatePage(),
                    ),
                  );
                },
                child: Text(
                  '¿Olvidaste Contraseña?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Iniciar sesión con Firebase
Future<User?> signInWithEmailAndPassword(BuildContext context,String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  } catch (e) {
    print("Error al iniciar sesión: $e");
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error al iniciar sesión'),
          content: Text(e.toString()),
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
}

// Obtener el rol del usuario actual
Future<String?> getUserRole(String userUid) async {
  try {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userUid).get();
    if (userSnapshot.exists) {
      return userSnapshot['rol']; //devuelve, 'rol' es el campo que almacena el rol.
    } else {
      return null;
    }
  } catch (e) {
    print("Error al obtener el rol del usuario: $e");
    return null;
  }
}