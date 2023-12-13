import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Tortilleria/loggin.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key});


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String? name;
  String? email;
  String? address;
  String role='cliente';
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Registro de Usuario'),
        backgroundColor: const Color(0xFF0C304B),
      ),
      //body: Center(
       body: SingleChildScrollView(
         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
         child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(30)),
              Text(
                "Registro de Usuario",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Padding(padding: EdgeInsets.all(25)),

              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),

              const Padding(padding: EdgeInsets.all(5)),

              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  labelText: 'Correo',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),

              const Padding(padding: EdgeInsets.all(5)),

              TextField(
                onChanged: (value) {
                  address = value;
                },
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              /*TextField(
                onChanged: (value) {
                  role = value;
                },
                decoration: InputDecoration(
                  hintText: 'Rol',
                ),
              ),*/
              const Padding(padding: EdgeInsets.all(5)),

              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña (mínimo 6 carácteres)',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),

              const Padding(padding: EdgeInsets.all(15)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C304B),
                  textStyle: const TextStyle(fontSize: 20),
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email ?? '',
                      password: password ?? '',
                    );
                    if (newUser != null) {
                      await _firestore.collection('users').doc(newUser.user?.uid).set({
                        'nombre': name,
                        'correo': email,
                        'direccion': address,
                        'rol': role,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Loggin()),
                      );
                      // Redirige a la pantalla principal o realiza alguna otra acción.
                    }
                  } catch (e) {
                    print(e);
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error al Registrarse'),
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
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
      ),
    ),
    );
  }
}