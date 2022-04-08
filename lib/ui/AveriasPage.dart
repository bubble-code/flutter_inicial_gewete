import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import 'package:flutter_inicial_gewete/ui/widget/AveriasGrid.dart';
import 'package:flutter_inicial_gewete/ui/widget/custom_app_bar.dart';

class AveriasPage extends StatefulWidget {
  const AveriasPage({Key? key}) : super(key: key);

  @override
  State<AveriasPage> createState() => _AveriasPageState();
}

class _AveriasPageState extends State<AveriasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Averias Page"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(223, 181, 178, 213),
        ),
        child: const AveriasGrid(),
      ),
    );
  }
}
