import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tortilleria/admin/agregar_userAdmin.dart';
import 'package:Tortilleria/loggin.dart';
import 'package:Tortilleria/admin/perfilAdmin.dart';
import 'package:Tortilleria/admin/clientesAdmin.dart';
import 'package:Tortilleria/admin/pedidosAdmin.dart';
import 'package:Tortilleria/admin/repartidoresAdmin.dart';
import 'package:Tortilleria/admin/reportesAdmin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'acercaDeAdmin.dart';

class InventarioAdmin extends StatefulWidget {
  const InventarioAdmin({Key? key});

  @override
  State<InventarioAdmin> createState() => _InventarioAdminState();
}

class _InventarioAdminState extends State<InventarioAdmin> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  TextEditingController _stockController = TextEditingController();
  final TextEditingController _unidadMedidaController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //Esta linea es para ocultar el banner de debug
      title: 'Inventario',
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
                      MaterialPageRoute(
                          builder: (context) => const PerfilAdmin()),
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
                          builder: (context) => const ClientesAdmin()),
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

                //Ruta 1 boton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AgregarUserAdmin()),
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
                        Icons.person_add,
                        color: Colors
                            .white, //ajustar el color según tus necesidades
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
                      MaterialPageRoute(
                          builder: (context) => const InventarioAdmin()),
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
                      MaterialPageRoute(
                          builder: (context) => const PedidosAdmin()),
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

                const Padding(padding: EdgeInsets.all(5)),
                //Ruta 5
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RepartidoresAdmin()),
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
                      MaterialPageRoute(
                          builder: (context) => const ReportesAdmin()),
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
                      FaIcon(
                        FontAwesomeIcons.fileAlt, // Icono de "reportes"
                        color: Colors.white, // Color del icono
                      ), // Agregar un icono
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
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: _getInventoryData(),
                  builder: (context,
                      AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      Map<String, dynamic> data = snapshot.data!;

                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('Tipo: ${data['nombre_tortilla']}',
                                  style: const TextStyle(fontSize: 20)),
                              subtitle: Container(
                                child: (Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Precio: ${data['precio_tortilla']}',
                                        style: const TextStyle(fontSize: 17)),
                                    Text(
                                        'Stock Disponible: ${data['stock_disponible']}',
                                        style: const TextStyle(fontSize: 17)),
                                    Text(
                                        'Unidad de Medida: ${data['unidad_medida']}',
                                        style: const TextStyle(fontSize: 17)),
                                  ],
                                )),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child:
                            Text('No hay datos en la colección "inventario"'),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nombreController,
                        decoration:
                            InputDecoration(labelText: 'Nombre de la tortilla'),
                      ),
                      TextField(
                        controller: _precioController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration:
                            InputDecoration(labelText: 'Precio de la tortilla'),
                      ),
                      /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: decrementQuantity,
                            ),
                            SizedBox(
                              width: 50.0,
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                controller: _stockController = TextEditingController(text: quantity.toString()),
                                onChanged: (value) {
                                  // Puedes agregar validaciones u otras lógicas aquí si es necesario
                                  setState(() {
                                    quantity = int.tryParse(value) ?? 1;
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: incrementQuantity,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Cantidad: $quantity',
                          style: TextStyle(fontSize: 18.0),
                        ),*/
                      TextField(
                        controller: _stockController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Stock disponible'),
                      ),
                      TextField(
                        controller: _unidadMedidaController,
                        decoration:
                            InputDecoration(labelText: 'Unidad de medida'),
                      ),
                      SizedBox(height: 25.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0C304B),
                          textStyle: const TextStyle(fontSize: 20),
                          fixedSize: const Size(200, 50),
                        ),
                        onPressed: () async {
                          await _addOrUpdateInventory(context);
                        },
                        child: Text('Agregar/Actualizar el Inventario'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stream<Map<String, dynamic>> _getInventoryData() {
    return _firestore.collection('inventario').snapshots().map(
          (QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          QueryDocumentSnapshot firstDocument = querySnapshot.docs.first;
          return firstDocument.data() as Map<String, dynamic>;
        } else {
          return {};
        }
      },
    );
  }

  Future<void> _addOrUpdateInventory(BuildContext context) async {
    // Obtener los valores de los controladores
    String name = _nombreController.text;
    String unit = _unidadMedidaController.text;
    CollectionReference inventoryCollection = _firestore.collection('inventario');
    // Obtener los documentos existentes en la colección
    QuerySnapshot inventorySnapshot = await inventoryCollection.get();
    // Verificar que todos los campos estén llenos
    DocumentSnapshot firstDocument = inventorySnapshot.docs.first;
    // Obtener la referencia a la colección "inventario"

    if (inventorySnapshot.docs.isEmpty &&
        _nombreController.text.isNotEmpty &&
        _precioController.text.isNotEmpty &&
        _stockController.text.isNotEmpty &&
        _unidadMedidaController.text.isNotEmpty) {
      double price = double.parse(_precioController.text);
      int stock = int.parse(_stockController.text);

      // Si no hay documentos, agregar uno nuevo
      await inventoryCollection.add({
        'nombre_tortilla': name,
        'precio_tortilla': price,
        'stock_disponible': stock,
        'unidad_medida': unit,
      });
    } else {

      // Si hay documentos, actualizar el primero (suponiendo que solo hay uno)
      if (_nombreController.text.isNotEmpty) {
        await firstDocument.reference.update({
          'nombre_tortilla': name,
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InventarioAdmin()),
        );
      }
      if (_precioController.text.isNotEmpty) {
        double price = double.parse(_precioController.text);
        await firstDocument.reference.update({
          'precio_tortilla': price,
        });
      }
      if (_stockController.text.isNotEmpty) {
        int stock = int.parse(_stockController.text);
        await firstDocument.reference.update({
          'stock_disponible': stock,
        });
      }
      if (unit.isNotEmpty) {
        await firstDocument.reference.update({
          'unidad_medida': unit,
        });
      }
      if (_nombreController.text.isEmpty &&
          _precioController.text.isEmpty &&
          _stockController.text.isEmpty &&
          _unidadMedidaController.text.isEmpty) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error al Actualizar Inventario'),
              content: Text('Debe actualizar por lo menos un campo'),
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
      /*await firstDocument.reference.update({
          'nombre_tortilla': name,
          'precio_tortilla': price,
          'stock_disponible': stock,
          'unidad_medida': unit,
        });*/
    }

    // Limpiar los controladores después de agregar o actualizar
    /*_nombreController.clear();
      _precioController.clear();
      _stockController.clear();
      _unidadMedidaController.clear();*/
  }
}
