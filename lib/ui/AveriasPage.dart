import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import 'package:flutter_inicial_gewete/ui/widget/AveriasGrid.dart';
import 'package:flutter_inicial_gewete/ui/widget/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

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
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Averias",
          style: GoogleFonts.rajdhani(
            textStyle:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 13,
            child: Image.asset('assets/images/logo.png'),
            backgroundColor: Colors.transparent,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                // color: Color.fromARGB(223, 181, 178, 213),
                ),
            child: const AveriasGrid(),
          ),
        ],
      ),
    );
  }
}
