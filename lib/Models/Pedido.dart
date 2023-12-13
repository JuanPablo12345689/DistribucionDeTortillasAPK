
class Pedido {
  final DateTime fecha;
  final int cantidad;
  final double monto;
  final String status;
  final String nombre;
  final String direccion;
  final DateTime fechaEntrega;

  Pedido({
    required this.fecha,
    required this.cantidad,
    required this.monto,
    required this.status,
    required this.nombre,
    required this.direccion,
    required this.fechaEntrega
  });

  Map<String, dynamic> toMap() {
    return {
      'fecha': fecha,
      'cantidad': cantidad,
      'monto': monto,
      'status': status,
      'nombre':nombre,
      'direccion':direccion,
      'fecha_entrega': fechaEntrega
    };
  }
}


