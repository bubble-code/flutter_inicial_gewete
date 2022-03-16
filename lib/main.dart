import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/ui/authentication.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Merkur Tecnicos',
      home: Authentication(),
    );
  }
}
