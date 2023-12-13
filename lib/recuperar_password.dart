import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PasswordUpdatePage extends StatefulWidget {
  const PasswordUpdatePage({Key? key});

  @override
  State<PasswordUpdatePage> createState() => _PasswordUpdatePageState();
}

class _PasswordUpdatePageState extends State<PasswordUpdatePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Actualizar Contraseña'),
          backgroundColor: const Color(0xFF0C304B)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(30)),
              Text(
                "Recuperacion de Contraseña",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.all(50)),
              TextFormField(
                controller: emailController,
                decoration:
                    InputDecoration(labelText: 'Correo Electrónico Actual'),
              ),
              const Padding(padding: EdgeInsets.all(30)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C304B),
                  textStyle: const TextStyle(fontSize: 20),
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () async {
                  updatePassword(context, emailController.text);
                },
                child: Text('Confirmar Correo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> updatePassword(BuildContext context, String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    // Firebase enviará un correo electrónico de reinicio de contraseña al usuario.
    // El usuario debe hacer clic en el enlace de reinicio de contraseña en el correo electrónico para completar el proceso.

    // Puedes mostrar un mensaje al usuario indicándole que revise su correo electrónico.
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Correo de Reinicio de Contraseña Enviado'),
          content: Text(
              'Por favor, revise su correo electrónico para restablecer su contraseña.'),
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
  } catch (e) {
    // Maneja errores, como si el correo electrónico no existe en Firebase o si ocurren otros problemas.
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error al Actualizar Contraseña'),
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
