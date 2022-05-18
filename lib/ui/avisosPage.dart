import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import 'package:flutter_inicial_gewete/ui/widget/AveriasGrid.dart';
import 'package:flutter_inicial_gewete/ui/widget/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/salon_provider.dart';

class AvisosPage extends StatefulWidget {
  const AvisosPage({Key? key}) : super(key: key);

  @override
  State<AvisosPage> createState() => _AvisosPageState();
}

class _AvisosPageState extends State<AvisosPage> {
  final style = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Avisos",
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
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text("Avisos pendientes",
                    style: GoogleFonts.rajdhani(textStyle: style)),
                margin: const EdgeInsets.only(left: 24, top: 10),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                    Provider.of<SalonProvider>(context, listen: true)
                        .totalAveria
                        .toString(),
                    style: GoogleFonts.rajdhani(textStyle: style)),
                margin: const EdgeInsets.only(left: 24, top: 10),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                // color: Color.fromARGB(223, 181, 178, 213),
                ),
          ),
          const AveriasGrid(),
        ],
      ),
    );
  }
}
