import 'package:Tortilleria/cliente/acercaDe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tortilleria/Page/EditUsers.dart';
import 'package:Tortilleria/cliente/menuCli.dart';
import 'package:Tortilleria/loggin.dart';
import 'package:Tortilleria/main.dart';
import 'package:Tortilleria/cliente/perfilCli.dart';
import 'package:Tortilleria/cliente/pedidosCli.dart';
import 'package:Tortilleria/cliente/perfilCli.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PedidosCli extends StatefulWidget {
  const PedidosCli({Key? key});
  @override
  State<PedidosCli> createState() => _PedidosCliState();
}

class _PedidosCliState extends State<PedidosCli> with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late TabController _tabController;
  User? _currentUser;
  void initState() {
    super.initState();
    // Verificar si el usuario ha iniciado sesión.
    _currentUser = _auth.currentUser;
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget _pedientePedido(){
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('users')
          .doc(_currentUser!.uid)
          .collection('pedidos')
          .where('status', isEqualTo: 'pendiente')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('Usted no ha realizado ningún pedido'),
          );
        } else {
          final pedidos = snapshot.data!.docs;
          return ListView.builder(
            //itemCount: snapshot.data!.docs.length,
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];
              final cantidad = pedido['cantidad'];
              final nombre = pedido['nombre'];
              final direccion = pedido['direccion'];
              final monto = pedido['monto'];
              final fecha = pedido['fecha'].toDate();
              final status = pedido['status'];
              int devolverStock = int.parse(cantidad.toString());
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
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      //title: Text('Nombre: ${userData['nombre']}'),
                      title: Text('Recibe: ${nombre}'),
                      subtitle: Container(
                        child: (Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Dirección: ${direccion}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Cantidad: ${cantidad} Kg de Tortillas',
                                style: const TextStyle(fontSize: 14)),
                            Text(
                                'Fecha en la que se realizo el pedido: ${fecha}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Status: ${status}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Monto Total: \$${monto} Pesos MXN',
                                style: const TextStyle(fontSize: 14)),
                          ],
                        )),
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
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        try {
                                          String pedidoId = pedidos[index].id;
                                          // Referencia al documento del pedido que quieres cancelar
                                          DocumentReference pedidoRef = _firestore
                                              .collection('users')
                                              .doc(_currentUser!.uid)
                                              .collection('pedidos')
                                              .doc(pedidoId);
                                          obtenerStockDisponible(devolverStock);
                                          DateTime fechaCancelada = DateTime
                                              .now();
                                          Navigator.of(context).pop();
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
                                                title:
                                                Text('Error al cancelar el pedido'),
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
              );
            },
          );
        }
      },
    );
  }
  @override
  Widget _entregadoPedido(){
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('users')
          .doc(_currentUser!.uid)
          .collection('pedidos')
          .where('status', isEqualTo: 'entregado')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('Usted no tiene pedidos entregados'),
          );
        } else {
          final pedidos = snapshot.data!.docs;
          return ListView.builder(
            //itemCount: snapshot.data!.docs.length,
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];
              final cantidad = pedido['cantidad'];
              final nombre = pedido['nombre'];
              final direccion = pedido['direccion'];
              final monto = pedido['monto'];
              final fecha = pedido['fecha'].toDate();
              final status = pedido['status'];
              final fechaEntrega = pedido['fecha_entrega'].toDate();

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
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      //title: Text('Nombre: ${userData['nombre']}'),
                      title: Text('Recibe: ${nombre}'),
                      subtitle: Container(
                        child: (Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Dirección: ${direccion}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Cantidad: ${cantidad} Kg de Tortillas',
                                style: const TextStyle(fontSize: 14)),
                            Text(
                                'Fecha en la que se realizo el pedido: ${fecha}',
                                style: const TextStyle(fontSize: 14)),
                            Text(
                                'Fecha en la que se entrego el pedido: ${fechaEntrega}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Status: ${status}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Monto Total: \$${monto} Pesos MXN',
                                style: const TextStyle(fontSize: 14)),
                          ],
                        )),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
  @override
  Widget _canceladoPedido(){
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('users')
          .doc(_currentUser!.uid)
          .collection('pedidos')
          .where('status', isEqualTo: 'cancelado')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('Usted no tiene pedidos cancelados'),
          );
        } else {
          final pedidos = snapshot.data!.docs;
          return ListView.builder(
            //itemCount: snapshot.data!.docs.length,
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];
              final cantidad = pedido['cantidad'];
              final nombre = pedido['nombre'];
              final direccion = pedido['direccion'];
              final monto = pedido['monto'];
              final fecha = pedido['fecha'].toDate();
              final status = pedido['status'];
              int devolverStock = int.parse(cantidad.toString());
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
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      //title: Text('Nombre: ${userData['nombre']}'),
                      title: Text('Recibe: ${nombre}'),
                      subtitle: Container(
                        child: (Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Dirección: ${direccion}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Cantidad: ${cantidad} Kg de Tortillas',
                                style: const TextStyle(fontSize: 14)),
                            Text(
                                'Fecha en la que se realizo el pedido: ${fecha}',
                                style: const TextStyle(fontSize: 14)),
                            Text(
                                'Fecha en la que se cancélo el pedido: ${pedido['fecha_entrega'].toDate()}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Status: ${status}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Monto Total: \$${monto} Pesos MXN',
                                style: const TextStyle(fontSize: 14)),
                          ],
                        )),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //Esta linea es para ocultar el banner de debug
      title: 'Pedidos',
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
                /*
                const Padding(padding: EdgeInsets.all(5)),
                //Ruta 3
                ElevatedButton(
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
        body: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Pendiente',
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
                  // Contenido de la pestaña Pendiente
                  _pedientePedido(),
                  // Contenido de la pestaña Entregados
                  _entregadoPedido(),
                  // Contenido de la pestaña Cancelados
                  _canceladoPedido(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
      
      print('Stock Disponible: $stockDisponible');
    } catch (error) {
      print('Error al obtener el stock disponible: $error');
    }
  }
}
