import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import 'package:flutter_inicial_gewete/model/Averias/AveriasModel.dart';
import 'package:flutter_inicial_gewete/ui/widget/AveriasGrid.dart';
import 'package:flutter_inicial_gewete/ui/widget/card_Averias.dart';
import 'package:flutter_inicial_gewete/ui/widget/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/salon_provider.dart';

class AveriasPage extends StatefulWidget {
  const AveriasPage({Key? key}) : super(key: key);

  @override
  State<AveriasPage> createState() => _AveriasPageState();
}

class _AveriasPageState extends State<AveriasPage> {
  final db = FirebaseFirestore.instance;
  late StreamSubscription sub;
  int cant = 0;
  final style = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final styleSubtitule =
      const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold);
  // @override
  // void initState() {
  //   super.initState();
  //   sub = db.collection("salones").doc("Madrid").collection("Averias").snapshots().listen((event) { })
  // }

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
      body: StreamBuilder(
          stream: db
              .collection("salones")
              .doc("Madrid")
              .collection("Averias")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            List<Widget> listOfWidgetAverias = [];
            Map<String, List<AveriasObject>> listaAverias = {};
            int cant = 0;
            double tiempo = 0;
            if (!snapshot.hasData) return Container();
            List<DocumentSnapshot> listOfDocumentSnapshot = snapshot.data!.docs;
            for (var e in listOfDocumentSnapshot) {
              cant++;
              String salon = e.get("from");
              if (listaAverias[salon] == null) listaAverias[salon] = [];
              listaAverias[salon]!.add(AveriasObject(
                date: e.get("date"),
                from: salon,
                id: e.get("id"),
                state: e.get("state"),
                detalles: 'e.get("detalles")',
                subject: e.get("subject"),
                tecnico: e.get("tecnico"),
              ));
              // listOfWidgetAverias.add(
              //   Card_Averias(
              //     faultsHall: {},
              //     // title: e.get("from"),
              //     // titulo: e.get("fecha").toString(),
              //     // detalles: e.get("detalles"),
              //     // fecha: "",
              //   ),
              // );
            }
            tiempo = (((cant * 20) + (listaAverias.length - 1) * 30) / 60);
            listaAverias.forEach(
              (key, value) {
                listOfWidgetAverias.add(Card_Averias(faultsHall: {key: value}));
              },
            );
            return ListView(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("Averias de hoy",
                          style: GoogleFonts.rajdhani(textStyle: style)),
                      margin: const EdgeInsets.only(left: 24, top: 10),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(cant.toString(),
                          style: GoogleFonts.rajdhani(textStyle: style)),
                      margin: const EdgeInsets.only(left: 24, top: 10),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("Tiempo estimado",
                          style:
                              GoogleFonts.rajdhani(textStyle: styleSubtitule)),
                      margin: const EdgeInsets.only(left: 24, top: 10),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(tiempo.toStringAsFixed(2) + " H",
                          style:
                              GoogleFonts.rajdhani(textStyle: styleSubtitule)),
                      margin: const EdgeInsets.only(left: 4, top: 10),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  decoration: const BoxDecoration(
                      // color: Color.fromARGB(223, 181, 178, 213),
                      ),
                ),
                // const AveriasGrid(),
                ...listOfWidgetAverias,
              ],
            );
          }),
    );
  }
}
