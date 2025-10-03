class SensorData {
  final double nivelAgua;
  final double ph;
  final double presion;
  final double temperatura;
  SensorData({
    required this.nivelAgua,
    required this.ph,
    required this.presion,
    required this.temperatura,
  });
  factory SensorData.fromMap(Map<dynamic, dynamic> map) {
    double toDouble(dynamic v) =>
        (v is int) ? v.toDouble() : (v as num).toDouble();
    return SensorData(
      nivelAgua: toDouble(map['nivel_de_agua']?['valor'] ?? 0),
      ph: toDouble(map['ph']?['valor'] ?? 0),
      presion: toDouble(map['presion_de_agua']?['valor'] ?? 0),
      temperatura: toDouble(map['temperatura']?['valor'] ?? 0),
    );
  }
}