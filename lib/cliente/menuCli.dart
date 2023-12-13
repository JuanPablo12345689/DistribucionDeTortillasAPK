import 'package:Tortilleria/cliente/acercaDe.dart';
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

class MenuCli extends StatefulWidget {
  const MenuCli({Key? key});
  @override
  State<MenuCli> createState() => _MenuCliState();
}

class _MenuCliState extends State<MenuCli> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _cantidadController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();
  User? _currentUser;
  @override
  int quantity = 1;
  int cantidadt = 0;
  int stocks = 0;
  double precio = 0;
  String status = 'pendiente';
  String nombre1 = "";
  String direccion1 = "";

  Widget _inventario() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/mi_logo.png',
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void actualizarDatos(double precios) {
    setState(() {
      cantidadt = int.parse(_cantidadController.text);
      precio = precios;
      stocks;
    });
  }

  void actualizarNombres(String nombre, String direccion) {
    setState(() {
      nombre1 = nombre;
      direccion1 = direccion;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void initState() {
    super.initState();
    // Verificar si el usuario ha iniciado sesión.
    _currentUser = _auth.currentUser;
  }

  Future<void> agregarPedido(User? userId, Pedido pedidos) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId!.uid)
          .collection('pedidos')
          .add(pedidos.toMap());
    } catch (e) {
      print('Error al agregar pedido: $e');
    }
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: _currentUser != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: _firestore
                          .collection('users')
                          .doc(_currentUser!.uid)
                          .get(),
                      builder: (context, snapshotUsuario) {
                        if (snapshotUsuario.hasData) {
                          var userData = snapshotUsuario.data!;
                          var name = userData['nombre'];
                          var address = userData['direccion'];
                          nombre1 = name.toString();
                          direccion1 = address.toString();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          );
                        } else {
                          return Text('');
                        }
                      },
                    ),
                    StreamBuilder(
                      stream: _getInventoryData(),
                      builder: (context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          Map<String, dynamic> data = snapshot.data!;
                          var precio = data['precio_tortilla'];
                          var stock = data['stock_disponible'];
                          var medida = data['unidad_medida'];
                          double precioInt = double.parse(precio.toString());
                          stocks = int.parse(stock.toString());
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('${data['nombre_tortilla']}',
                                      style: const TextStyle(fontSize: 20)),
                                  subtitle: Container(
                                    child: (Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                            'Precio: \$${precio} por cada ${medida} de tortillas',
                                            style:
                                                const TextStyle(fontSize: 17)),
                                        Text(
                                            'Stock Disponible: ${data['stock_disponible']}',
                                            style:
                                                const TextStyle(fontSize: 17)),
                                      ],
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _cantidadController,
                                    decoration:
                                        InputDecoration(labelText: 'Cantidad'),
                                    onChanged: (value) {
                                      // Llama a la función para actualizar los datos
                                      actualizarDatos(precioInt);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  'Monto Total: \$${cantidadt * precioInt}',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    //---------------------------------
                                    if (_currentUser != null) {
                                      try {
                                        int cantidad =
                                            int.parse(_cantidadController.text);
                                        // Obtener los valores de cantidad y monto desde los controladores
                                        if (cantidad <= stocks) {
                                          if (cantidad > 0) {
                                            CollectionReference
                                                inventoryCollection = _firestore
                                                    .collection('inventario');
                                            // Obtener los documentos existentes en la colección
                                            QuerySnapshot inventorySnapshot =
                                                await inventoryCollection.get();
                                            // Verificar que todos los campos estén llenos
                                            DocumentSnapshot firstDocument =
                                                inventorySnapshot.docs.first;
                                            int stockTotal = stocks - cantidad;
                                            double monto = cantidadt.toDouble() * precio.toDouble();
                                            // Obtener la fecha actual
                                            DateTime fechaCompra = DateTime.now();
                                            DateTime fechaEntrega = DateTime.now();
                                            Pedido nuevoPedido = Pedido(
                                                fecha: fechaCompra,
                                                cantidad: cantidad,
                                                monto: monto,
                                                status: status,
                                                nombre: nombre1,
                                                direccion: direccion1,
                                                fechaEntrega: fechaEntrega);

                                            // Registrar el pedido en la colección 'pedidos' de Firestore
                                            await agregarPedido(
                                                _currentUser, nuevoPedido);
                                            await firstDocument.reference
                                                .update({
                                              'stock_disponible': stockTotal,
                                            });
                                            await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Pedido confirmado y registrado con éxito'),
                                                  content:
                                                      Text('Pedido Confirmado'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            // Mensaje de confirmación
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Pedido confirmado y registrado con éxito'),
                                              ),
                                            );
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Error al Realizar el Pedido'),
                                                  content: Text(
                                                      'La cantidad no puede ser 0'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Error al Realizar el Pedido'),
                                                content:
                                                    Text('Stock insuficiente'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      } catch (e) {
                                        print(
                                            'Error al confirmar el pedido: $e');
                                        await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Error al Realizar Pedido'),
                                              content:
                                                  Text('Debe actualizar: $e'),
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
                                        // Manejar errores según sea necesario
                                      }
                                    } //--------------------
                                  },
                                  child: Text('Confirmar Pedido'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: Text('No hay datos en el inventario'),
                          );
                        }
                      },
                    ),
                  ],
                )
              : Text('Usuario no logueado'),
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
}
