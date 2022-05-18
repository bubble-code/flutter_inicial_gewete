import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/model/AvisosModel.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttonDashGrid.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttonInicioAverias.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttonInicioAvisos.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttonInicioGWT.dart';
import 'package:flutter_inicial_gewete/ui/widget/cardInicioAvisos.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListView listNameSalones(SalonProvider objectSalon) {
    List<Widget> childd = [];
    if (!objectSalon.loading) {
      for (var e in objectSalon.listResult) {
        childd.add(ButtonDashGrid(title: e.salon));
      }
      EasyLoading.dismiss();
    } else {
      EasyLoading.show(status: "loading...");
    }
    return ListView(scrollDirection: Axis.horizontal, children: [...childd]);
  }

  @override
  void initState() {
    super.initState();
    final salones = Provider.of<SalonProvider>(context, listen: false);
    salones.getSalon("Madrid");
    // salones.getTotalAverias(salones.listResult);
    // print(salones.totalAverias);
  }

  final style = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final nameSalones = Provider.of<SalonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Inicio"),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          CircleAvatar(
            radius: 15,
            child: Image.asset('assets/images/logo.png'),
            backgroundColor: Colors.transparent,
          )
        ],
      ),
      body: Column(children: [
        SizedBox(height: 20, width: MediaQuery.of(context).size.width),
        Container(
          alignment: Alignment.topLeft,
          child: Text("Madrid", style: GoogleFonts.rajdhani(textStyle: style)),
          margin: const EdgeInsets.only(left: 24, bottom: 5),
        ),
        Container(
            height: 70,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: listNameSalones(nameSalones)),
        Container(
          // height: MediaQuery.of(context).size.height * 1,
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(color: Colors.white70),
          child: Column(
            children: [
              //Lista de Botones de salones
              Container(
                alignment: Alignment.topLeft,
                child: Text("Tareas del dia",
                    style: GoogleFonts.rajdhani(textStyle: style)),
                margin: const EdgeInsets.only(left: 12, bottom: 5),
              ),
              // Botones de Inicio Averias GWT Avisos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonInicioAverias(
                    title: "AVERIAS",
                    heigh: 100,
                    width: 100,
                  ),
                  ButtonInicioGWT(
                    title: "GWT",
                    heigh: 100,
                    width: 100,
                  ),
                  ButtonInicioAvisos(
                    title: "AVISOS",
                    heigh: 100,
                    width: 100,
                  ),
                  // ButtonDashGrid(title: "GWT"),
                  // ButtonDashGrid(title: "Avisos"),
                ],
              ),
              //Barra de ejecucion de tareas
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1,
                margin: const EdgeInsets.only(top: 12),
                // decoration: const BoxDecoration(
                //   color: Colors.amber,
                // ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12, right: 8),
                          child: Text(
                            "Ejecucion de Tareas: ",
                            style: GoogleFonts.rajdhani(textStyle: style),
                          ),
                        ),
                        Text(
                          "60%",
                          style: GoogleFonts.rajdhani(textStyle: style),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 20, top: 5),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.red[50],
                        valueColor: AlwaysStoppedAnimation(Colors.red[200]),
                        value: 0.6,
                      ),
                    ),
                  ],
                ),
              ),
              //Card de Avisos
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        CardInicioAvisos(),
        //Card de Avisos
      ]),
    );
  }

//===================================================

}
