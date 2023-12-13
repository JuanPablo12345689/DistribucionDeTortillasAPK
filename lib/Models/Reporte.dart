class Reporte {
  final DateTime fecha;
  final int cantidad_total;
  final double ganancia_total;

  Reporte({
    required this.fecha,
    required this.cantidad_total,
    required this.ganancia_total
  });

  Map<String, dynamic> toMap() {
    return {
      'fecha': fecha,
      'ganancia_total':ganancia_total,
      'total_ventas': cantidad_total
    };
  }
}
