import 'package:flutter/material.dart';
import '../servicios/firebase_service.dart';
import '../modelos/sensor_data.dart';
import '../modelos/actuador.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = FirebasePiscinaService();

    return Scaffold(
      appBar: AppBar(title: const Text("Piscina - Monitoreo")),
      body: StreamBuilder<SensorData>(
        stream: service.sensoresStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final s = snapshot.data!;
          return Column(
            children: [
              Text("Nivel de agua: ${s.nivelAgua} %"),
              Text("pH: ${s.ph}"),
              Text("Presión: ${s.presion} psi"),
              Text("Temperatura: ${s.temperatura} °C"),
              const SizedBox(height: 20),
              StreamBuilder<Map<String, Actuador>>(
                stream: service.actuadoresStream(),
                builder: (context, snap) {
                  if (!snap.hasData) return const Text("Cargando actuadores...");
                  final actuadores = snap.data!;
                  final pump = actuadores["pump"];
                  return ElevatedButton(
                    onPressed: () {
                      final nuevoEstado = pump!.estado == "ON" ? "OFF" : "ON";
                      service.setActuador("pump", nuevoEstado);
                    },
                    child: Text("Bomba: ${pump?.estado ?? '---'}"),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}