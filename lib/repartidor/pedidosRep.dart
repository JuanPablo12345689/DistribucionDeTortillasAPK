import 'package:Tortilleria/repartidor/acercaDeRep.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tortilleria/Page/EditUsers.dart';
import 'package:Tortilleria/loggin.dart';
import 'package:Tortilleria/main.dart';
import 'package:Tortilleria/repartidor/clientesRep.dart';
import 'package:Tortilleria/repartidor/pedidosRep.dart';
import 'package:Tortilleria/repartidor/perfilRep.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Models/Reporte.dart';

class PedidosRep extends StatefulWidget {
  const PedidosRep({Key? key});
  @override
  State<PedidosRep> createState() => _PedidosRepState();
}

class _PedidosRepState extends State<PedidosRep> with SingleTickerProviderStateMixin{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //Esta linea es para ocultar el banner de debug
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
                        MaterialPageRoute(
                            builder: (context) => const PerfilRep()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0C304B),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      primary:
                          Colors.blue, // Cambiar el color de fondo del botón
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
                  const Padding(padding: EdgeInsets.all(5)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const clientesRep()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0C304B),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      primary:
                          Colors.blue, // Cambiar el color de fondo del botón
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
                        MaterialPageRoute(
                            builder: (context) => const PedidosRep()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF57F17),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      primary:
                          Colors.blue, // Cambiar el color de fondo del botón
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
          body: Column(
            children: [
              Container(
                constraints: const BoxConstraints.expand(height: 50),
                child: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: 'Pendientes',
                    ),
                    Tab(
                      text: 'Entregados',
                    ),
                    Tab(
                      text: 'Cancelados',
                    ),
                  ],
                  labelColor: Color.fromARGB(255, 27, 89, 121),
                  unselectedLabelColor: Colors.black,
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Center(
                      child: FutureBuilder(//Pendiente
                        future: obtenerPedidosPendientes(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            List<Widget> pedidosWidgets = snapshot.data!;

                            if (pedidosWidgets.isEmpty) {
                              return Center(
                                child: Text('No hay pedidos pendientes'),
                              );
                            }

                            return ListView(
                              children: pedidosWidgets,
                            );
                          }
                        },
                      ),
                    ),
                    Center(
                      child: FutureBuilder(//Entregados
                        future: obtenerPedidosEntregados(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            List<Widget> pedidosWidgets = snapshot.data!;

                            if (pedidosWidgets.isEmpty) {
                              return Text('No hay pedidos entregados');
                            }

                            return ListView(
                              children: pedidosWidgets,
                            );
                          }
                        },
                      ),
                    ),
                    Center(
                      child: FutureBuilder(//Cancelados
                        future: obtenerPedidosCancelados(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            List<Widget> pedidosWidgets = snapshot.data!;

                            if (pedidosWidgets.isEmpty) {
                              return Center(
                                child: Text('No hay pedidos cancelados'),
                              );
                            }

                            return ListView(
                              children: pedidosWidgets,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }


  Future<void> agregarReporte(double ganancia_total,int cantidad,  Reporte report) async {
    try {
      CollectionReference reportCollection = _firestore.collection('reportes');
      DateTime fechaActual = DateTime.now();
      fechaActual = DateTime(fechaActual.year, fechaActual.month, fechaActual.day);
      QuerySnapshot querySnapshot = await reportCollection
          .where('fecha', isGreaterThanOrEqualTo: fechaActual)
          .where('fecha', isLessThan: fechaActual.add(Duration(days: 1)))
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Obtiene el ID del primer documento encontrado
        String documentId = querySnapshot.docs[0].id;
        print('ID del documento con fecha actual: $documentId');

        DocumentReference documentReference = reportCollection.doc(documentId); // Reemplaza con el ID correcto

        // Obten el valor actual de 'cantidad'
        DocumentSnapshot documentSnapshot = await documentReference.get();
        int cantidadActual = documentSnapshot['total_ventas'];
        double gananciaActual = documentSnapshot['ganancia_total'];
        double nuevaGanancia = gananciaActual + ganancia_total;
        // Actualiza 'cantidad' con el nuevo valor
        int nuevaCantidad = cantidadActual + cantidad;

        // Actualiza el documento en la colección
        await documentReference.update({
          'ganancia_total':nuevaGanancia,
          'total_ventas': nuevaCantidad
        });

      } else {
        print('No se encontraron documentos con la fecha actual $ganancia_total');
        try {
          await FirebaseFirestore.instance
              .collection('reportes')
              .add(report.toMap());
        } catch (e) {
          print('Error al agregar pedido: $e');
        }
      }
      /* await reportCollection.add({
        pedidos.toMap()
      });*/
    } catch (e) {
      print('Error al agregar informacion al reporte: $e');
    }
  }
  Future<List<Widget>> obtenerPedidosPendientes() async {
    List<Widget> pedidosWidgets = [];

    var usersSnapshot = await _firestore.collection('users').get();

    for (var user in usersSnapshot.docs) {
      var userId = user.id;

      var pedidosSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('pedidos')
          .where('status', isEqualTo: 'pendiente')
          .get();

      if (pedidosSnapshot.docs.isNotEmpty) {
        var pedidos = pedidosSnapshot.docs;
        for (var pedido in pedidos) {
          var pedidoId = pedido.id;
          var cantida = pedido['cantidad'];
          int devolverStock = int.parse(cantida.toString());
          var ganan = pedido['monto'];
          var canti = pedido['cantidad'];
          double ganancia = double.parse(ganan.toString());
          int cantidad =int.parse(canti.toString());
          pedidosWidgets.add(
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nombre del Cliente: ${pedido['nombre']}'),//Text('Usuario: $userId'),
                    subtitle: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Dirección: ${pedido['direccion']}',
                              style: const TextStyle(fontSize: 14)),
                          Text(
                              'Cantidad: ${pedido['cantidad']} Kg de Tortillas',
                              style: const TextStyle(fontSize: 14)),
                          Text(
                              'Fecha en la que se realizo el pedido: ${pedido['fecha'].toDate()}',
                              style: const TextStyle(fontSize: 14)),
                          Text('Status: ${pedido['status']}',
                              style: const TextStyle(fontSize: 14)),
                          Text('Monto Total: \$${pedido['monto']} Pesos MXN',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Cambia el color de fondo aquí
                          onPrimary: Colors.white, // Cambia el color del texto aquí
                          textStyle: const TextStyle(fontSize: 20),
                          padding: const EdgeInsets.all(5.0),
                        ),
                        child: const Text("Cancelar"),
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirmar Cancelación'),
                                content: Text('¿Estás seguro de que deseas cancelar el pedido?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {

                                    },
                                    child: Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      try {
                                        // Referencia al documento del pedido que quieres cancelar
                                        DocumentReference pedidoRef = _firestore
                                            .collection('users')
                                            .doc(userId)
                                            .collection('pedidos')
                                            .doc(pedidoId);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const PedidosRep()),
                                        );
                                        obtenerStockDisponible(devolverStock);
                                        // Actualiza el estado del pedido a "cancelado" en la base de datos
                                        DateTime fechaCancelada = DateTime
                                            .now();
                                        // Actualiza el estado del pedido a "cancelado" en la base de datos
                                        await pedidoRef.update({
                                          'status': 'cancelado',
                                          'fecha_entrega': fechaCancelada
                                        });

                                        // Muestra un mensaje de éxito o realiza otras acciones necesarias
                                        print('Pedido cancelado con éxito');
                                      } catch (error) {
                                        print('Error al cancelar el pedido: $error');
                                        await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Error al cancelar el pedido'),
                                              content: Text('$error'),
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
                                    child: Text('Confirmar'),
                                  ),
                                ],
                              );
                            },
                          );

                        },
                      ),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(5.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        child: const Text("Entregado"),
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirmar Entrega'),
                                content: Text(''),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () async {
                                      try {

                                        DocumentReference pedidoRef = _firestore
                                            .collection('users')
                                            .doc(userId)
                                            .collection('pedidos')
                                            .doc(pedidoId);

                                        DateTime fechaEntrega = DateTime.now();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const PedidosRep()),
                                        );
                                        Reporte nuevoReport = Reporte(
                                          fecha: fechaEntrega,
                                          cantidad_total: int.parse(canti.toString()),
                                          ganancia_total: double.parse(ganan.toString()),
                                        );
                                        agregarReporte(ganancia, cantidad, nuevoReport);
                                        await pedidoRef.update({
                                          'status': 'entregado',
                                          'fecha_entrega': fechaEntrega
                                        });


                                        print('Pedido entregado con éxito');
                                      } catch (error) {
                                        print('Error al registrar la entrega del pedido: $error');
                                        await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Error al registrar la entrega del pedido'),
                                              content: Text('$error'),
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
                                    child: Text('Confirmar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }
    }

    return pedidosWidgets;
  }
  Future<List<Widget>> obtenerPedidosEntregados() async {
    List<Widget> pedidosWidgets = [];

    var usersSnapshot = await _firestore.collection('users').get();

    for (var user in usersSnapshot.docs) {
      var userId = user.id;

      var pedidosSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('pedidos')
          .where('status', isEqualTo: 'entregado')
          .get();

      if (pedidosSnapshot.docs.isNotEmpty) {
        var pedidos = pedidosSnapshot.docs;
        for (var pedido in pedidos) {
          var pedidoId = pedido.id;
          var cantidad = pedido['cantidad'];
          int devolverStock = int.parse(cantidad.toString());
          pedidosWidgets.add(
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nombre del Cliente: ${pedido['nombre']}'),//Text('Usuario: $userId'),
                    subtitle: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Dirección: ${pedido['direccion']}',
                              style: const TextStyle(fontSize: 14)),
                          Text(
                              'Cantidad: ${pedido['cantidad']} Kg de Tortillas',
                              style: const TextStyle(fontSize: 14)),
                          Text(
                              'Fecha en la que se realizo el pedido: ${pedido['fecha'].toDate()}',
                              style: const TextStyle(fontSize: 14)),
                          Text(
                              'Fecha en la que se entrégo el pedido: ${pedido['fecha_entrega'].toDate()}',
                              style: const TextStyle(fontSize: 14)),
                          Text('Status: ${pedido['status']}',
                              style: const TextStyle(fontSize: 14)),
                          Text('Monto Total: \$${pedido['monto']} Pesos MXN',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }
    }

    return pedidosWidgets;
  }
  Future<List<Widget>> obtenerPedidosCancelados() async {
    List<Widget> pedidosWidgets = [];

    var usersSnapshot = await _firestore.collection('users').get();

    for (var user in usersSnapshot.docs) {
      var userId = user.id;

      var pedidosSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('pedidos')
          .where('status', isEqualTo: 'cancelado')
          .get();

      if (pedidosSnapshot.docs.isNotEmpty) {
        var pedidos = pedidosSnapshot.docs;
        for (var pedido in pedidos) {
          var pedidoId = pedido.id;
          var cantidad = pedido['cantidad'];
          int devolverStock = int.parse(cantidad.toString());
          pedidosWidgets.add(
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nombre del Cliente: ${pedido['nombre']}'),//Text('Usuario: $userId'),
                    subtitle: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //Text('Nombre del Cliente: ${pedido['nombre']}'),
                          Text('Dirección: ${pedido['direccion']}',
                              style: const TextStyle(fontSize: 14)),
                          Text(
                              'Cantidad: ${pedido['cantidad']} Kg de Tortillas',
                              style: const TextStyle(fontSize: 14)),
                          Text(
                              'Fecha en la que se realizo el pedido: ${pedido['fecha'].toDate()}',
                              style: const TextStyle(fontSize: 14)),
                          Text(
                              'Fecha en la que se cancélo el pedido: ${pedido['fecha_entrega'].toDate()}',
                              style: const TextStyle(fontSize: 14)),
                          Text('Status: ${pedido['status']}',
                              style: const TextStyle(fontSize: 14)),
                          Text('Monto Total: \$${pedido['monto']} Pesos MXN',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }
    }

    return pedidosWidgets;
  }
  Future<void> obtenerStockDisponible(int stock) async {
    try {
      // Obtiene el documento único en la colección 'inventario'
      DocumentSnapshot inventarioDoc = await _firestore.collection('inventario').doc('WsuYF06MDnKDQzEqd463').get();

      // Obtiene el valor de 'stock_disponible' del documento
      int stockDisponible = inventarioDoc['stock_disponible'];
      int nuevoStock = stockDisponible + stock;
      await _firestore.collection('inventario').doc('WsuYF06MDnKDQzEqd463').update({
        'stock_disponible': nuevoStock
      });

      // Puedes usar el valor de 'stock_disponible' como necesites
      print('Stock Disponible: $stockDisponible');
    } catch (error) {
      print('Error al obtener el stock disponible: $error');
    }
  }
}
