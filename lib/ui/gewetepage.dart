import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import 'package:flutter_inicial_gewete/ui/widget/custom_app_bar.dart';
import 'package:flutter_inicial_gewete/ui/widget/geweteGrid.dart';
import 'package:google_fonts/google_fonts.dart';

class GewetePage extends StatefulWidget {
  const GewetePage({Key? key}) : super(key: key);

  @override
  State<GewetePage> createState() => _GewetePageState();
}

class _GewetePageState extends State<GewetePage> {
  final style = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Gewetes",
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
                child: Text("Gewetes de Madrid",
                    style: GoogleFonts.rajdhani(textStyle: style)),
                margin: const EdgeInsets.only(left: 24, top: 10),
              ),
              // Container(
              //   alignment: Alignment.topLeft,
              //   child:
              //       Text("90", style: GoogleFonts.rajdhani(textStyle: style)),
              //   margin: const EdgeInsets.only(left: 24, top: 10),
              // ),
            ],
          ),
          GeweteGrid(),
        ],
      ),
    );
  }
}
