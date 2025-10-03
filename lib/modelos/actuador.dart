class Actuador {
  final String pin;
  final String estado;

  Actuador({required this.pin, required this.estado});

  factory Actuador.fromMap(Map<dynamic, dynamic> map) {
    return Actuador(
      pin: map['pin'] ?? '',
      estado: map['estado'] ?? 'OFF',
    );
  }
}
