import 'package:flutter/material.dart';
import 'package:Tortilleria/Page/ListPage.dart';
import 'package:Tortilleria/loggin.dart';
import 'package:Tortilleria/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Esto es importante
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Bloquea la rotación en horizontal
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //Esta linea es para ocultar el banner de debug
      title: 'Tortillería La esperanza',
      home: Loggin(), //Esta es una clase que vamos a crear
    );
  }
}
