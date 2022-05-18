import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../config/Style.dart';

class ButtonInicioAvisos extends StatefulWidget {
  final String title;
  late final double height;
  late final double widt;
  late final int total;
  // final Color color;
  ButtonInicioAvisos({
    Key? key,
    required this.title,
    double heigh = 5,
    double width = 120,
    int total = 0,
  }) : super(key: key) {
    height = heigh;
    widt = width;
    total = total;
  }

  @override
  State<ButtonInicioAvisos> createState() => _ButtonInicioAvisosState();
}

class _ButtonInicioAvisosState extends State<ButtonInicioAvisos> {
  final db = FirebaseFirestore.instance;
  late StreamSubscription sub;
  int cant = 0;
  @override
  void initState() {
    super.initState();
    sub = db.collection("Checklist").snapshots().listen((event) {
      setState(() {
        cant = event.size;
      });
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final totalaver = Provider.of<SalonProvider>(context, listen: true);
    return InkWell(
      onTap: () {
        // totalaver.getTotalAverias(totalaver.listResult);
        Navigator.pushNamed(context, widget.title.toLowerCase());
      },
      child: Container(
        height: widget.height,
        width: widget.widt,
        // margin: const EdgeInsets.all(8),
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Center(
              child: Text(
                widget.title,
                style: GoogleFonts.rajdhani(
                    fontSize: 16,
                    color: Colors.green[300],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15, left: 0),
              // child: totalaver.salones.isNotEmpty
              //     ? Text(
              //         totalaver.totalAveria.toString(),
              //         style: GoogleFonts.rajdhani(
              //             fontSize: 16,
              //             color: Colors.green[300],
              //             fontWeight: FontWeight.bold),
              //       )
              // :
              child: Text(
                cant.toString(),
                style: GoogleFonts.rajdhani(
                    fontSize: 16,
                    color: Colors.green[300],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
