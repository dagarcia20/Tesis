import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../pantallas/dashboard.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PiscinaApp());
}

class PiscinaApp extends StatelessWidget {
  const PiscinaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piscina Monitor',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const DashboardPage(),
    );
  }
}