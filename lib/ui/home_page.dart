import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttonDashGrid.dart';
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
    salones.getTotalAverias(salones.listResult);
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
      body: ListView(children: [
        SizedBox(height: 20, width: MediaQuery.of(context).size.width),
        SizedBox(height: 70, child: listNameSalones(nameSalones)),
        Container(
          height: MediaQuery.of(context).size.height * 1,
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
                margin: const EdgeInsets.only(left: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonDashGrid(
                    title: "Averias",
                    heigh: 100,
                    width: 100,
                  ),
                  ButtonDashGrid(
                    title: "GWT",
                    heigh: 100,
                    width: 100,
                  ),
                  ButtonDashGrid(
                    title: "Avisos",
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
              const Card_Avisos(),
              const SizedBox(
                height: 20,
              ),
              //Card de Urgencias
              Container(
                margin: const EdgeInsets.only(top: 10, left: 14, right: 14),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 135,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 250, 233),
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Icono de la card
                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 10),
                      child: const Icon(Icons.calendar_today),
                    ),
                    //Text de la card
                    Container(
                      width: MediaQuery.of(context).size.width * 1 / 2,
                      margin: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recoger contadoras",
                            style: GoogleFonts.rajdhani(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[200],
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            runSpacing: 20,
                            children: [
                              Text(
                                "mañana recoger las contadoras a las 12:00 en Mecaban",
                                style: GoogleFonts.rajdhani(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Arrow de detalles de la card
                    Container(
                      margin: const EdgeInsets.only(top: 30, left: 20),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_right,
                          size: 35,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //Card de Avisos
              Container(
                margin: const EdgeInsets.only(top: 10, left: 14, right: 14),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 135,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 250, 233),
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Icono de la card
                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 10),
                      child: const Icon(Icons.calendar_today),
                    ),
                    //Text de la card
                    Container(
                      width: MediaQuery.of(context).size.width * 1 / 2,
                      margin: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recoger contadoras",
                            style: GoogleFonts.rajdhani(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[200],
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            runSpacing: 20,
                            children: [
                              Text(
                                "mañana recoger las contadoras a las 12:00 en Mecaban",
                                style: GoogleFonts.rajdhani(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Arrow de detalles de la card
                    Container(
                      margin: const EdgeInsets.only(top: 30, left: 20),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_right,
                          size: 35,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

//===================================================

}

class Card_Avisos extends StatelessWidget {
  const Card_Avisos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 14, right: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 135,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 250, 233),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Icono de la card
          Container(
            margin: EdgeInsets.only(left: 15, top: 10),
            child: const Icon(Icons.calendar_today),
          ),
          //Text de la card
          Container(
            width: MediaQuery.of(context).size.width * 1 / 2,
            margin: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recoger contadoras",
                  style: GoogleFonts.rajdhani(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[200],
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 20,
                  children: [
                    Text(
                      "mañana recoger las contadoras a las 12:00 en Mecaban",
                      style: GoogleFonts.rajdhani(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Arrow de detalles de la card
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_right,
                size: 35,
                color: Colors.amber,
              ),
            ),
          )
        ],
      ),
    );
  }
}
