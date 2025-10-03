import 'package:firebase_database/firebase_database.dart';
import '../modelos/sensor_data.dart';
import '../modelos/actuador.dart';

class FirebasePiscinaService {
  final _db = FirebaseDatabase.instance.ref();

  Stream<SensorData> sensoresStream() {
    return _db.child('sensores').onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return SensorData.fromMap(data);
    });
  }

  Stream<Map<String, Actuador>> actuadoresStream() {
    return _db.child('actuadores').onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.map((k, v) => MapEntry(k, Actuador.fromMap(v)));
    });
  }

  Future<void> setActuador(String nombre, String nuevoEstado) async {
    await _db.child('actuadores/$nombre/estado').set(nuevoEstado);
  }
}