import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/model/Averias/AveriasModel.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttomAccionAverias.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttomRepuestoAveriaPage.dart';
import 'package:flutter_inicial_gewete/ui/widget/card_Averias.dart';
import 'package:flutter_inicial_gewete/ui/widget/card_DetailsAverias.dart';
import 'package:google_fonts/google_fonts.dart';

class PageDetailsAverias extends StatefulWidget {
  final String salon;
  const PageDetailsAverias({
    Key? key,
    required this.salon,
  }) : super(key: key);

  @override
  State<PageDetailsAverias> createState() => _PageDetailsAveriasState();
}

class _PageDetailsAveriasState extends State<PageDetailsAverias> {
  final style = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);
  final db = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> sub;
  int cant = 0;
  @override
  void initState() {
    super.initState();
    sub = db
        .collection("salones")
        .doc("Madrid")
        .collection("Averias")
        .where('from', isEqualTo: widget.salon)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    // Map parametros = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          widget.salon,
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
      body: StreamBuilder<QuerySnapshot>(
          stream: sub,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            List<Widget> listAverias = [];
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            if (!snapshot.hasData) return Container();
            for (var item in snapshot.data!.docs) {
              listAverias.add(
                CardDetailsAverias(faultsHall: {
                  item.get("from"): [
                    AveriasObject(
                      date: item.get("date"),
                      detalles: 'item.get("date")',
                      from: item.get("from"),
                      id: item.get("id"),
                      prioridad: item.get("prioridad"),
                      state: item.get("state"),
                      subject: item.get("subject"),
                      tecnico: item.get("tecnico"),
                    ),
                  ]
                }),
              );
            }

            return ListView(
              children: [
                SizedBox(height: 20, width: MediaQuery.of(context).size.width),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Tiempo estimado: ",
                        style: GoogleFonts.rajdhani(textStyle: style),
                      ),
                      margin: const EdgeInsets.only(left: 24, top: 10),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1 / 3,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Tecnico 1",
                        style: GoogleFonts.rajdhani(textStyle: style),
                      ),
                      margin: const EdgeInsets.only(left: 24, top: 10),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 24, right: 12),
                      child: Text(
                        "Acciones:",
                        style: GoogleFonts.rajdhani(textStyle: style),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14, right: 12),
                      child: Row(
                        children: [
                          AccionAverias(
                            title: "Iniciar",
                            heigh: 30,
                            width: 100,
                          ),
                          AccionAverias(
                            title: "Terminar",
                            heigh: 30,
                            width: 100,
                          ),
                          AccionAverias(
                            title: "Aplazar",
                            heigh: 30,
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    children: listAverias,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 14, right: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonRepuestoAveriasPage(title: "Repuesto"),
                          ButtonRepuestoAveriasPage(title: "Historial"),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonRepuestoAveriasPage(title: "Repuesto"),
                          ButtonRepuestoAveriasPage(title: "Historial"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
