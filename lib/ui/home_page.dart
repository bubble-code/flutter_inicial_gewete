// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import 'package:flutter_inicial_gewete/config/Style.dart';
import 'package:flutter_inicial_gewete/model/GeweteObj.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttonDashGrid.dart';
// import 'package:flutter_inicial_gewete/ui/addLocationSalon.dart';
// import 'package:flutter_inicial_gewete/ui/widget/cardMain.dart';
// import 'package:flutter_inicial_gewete/ui/widget/cardMy.dart';
import 'package:flutter_inicial_gewete/ui/widget/custom_app_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_inicial_gewete/net/flutterfire.dart';
import 'package:flutter_inicial_gewete/model/SalonesModel.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final style = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  Future<List<NameSalon>> salonesList() async {
    List<GeweteObject> tem2 = await listSalones();
    List<NameSalon> listResult = [];
    for (var item in tem2) {
      listResult.add(NameSalon(
        salon: item.nombre,
      ));
      // ConnetionDB cc = ConnetionDB(item.ip, item.pass);
      // Map<double, dynamic> datosGewete = <double, dynamic>{};
      // await cc.connect();
      // await cc.reader("query").then((value) {
      //   for (var ele in value) {
      //     datosGewete[ele['type']] = ele['value'];
      //   }
      //   listResult
      //       .add(ButtonDashGrid(salon: item.nombre, valores: datosGewete));
      // });
    }
    return listResult;
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final fecha = formatDate(DateTime.now(), [DD, ' ', dd, '-', mm]);

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
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: Image.asset('assets/images/fondoMain.jpg').image,
        //       fit: BoxFit.cover),
        // ),
        child: ListView(children: [
          SizedBox(height: 20, width: MediaQuery.of(context).size.width),
          Container(
            height: 70,
            child: FutureBuilder(
                future: salonesList(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<NameSalon>> lis) {
                  List<Widget> childd = [];
                  if (lis.hasData) {
                    for (var e in lis.data!) {
                      childd.add(ButtonDashGrid(title: e.salon));
                    }
                    EasyLoading.dismiss();
                  } else if (lis.hasError) {
                    EasyLoading.showError("Fallo de conexion");
                  } else {
                    EasyLoading.show(status: "loading...");
                  }
                  return ListView(
                      scrollDirection: Axis.horizontal, children: [...childd]);
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 1,
            // padding: const EdgeInsets.all(20),
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
                      )
                    ],
                  ),
                )
              ],
            ),
          )
          // _buildHeader(screenHeight, fecha),
          // SliverPadding(
          //   padding: EdgeInsets.all(10),
          //   sliver: SliverToBoxAdapter(
          // child: DashGrid(
          //   firstRow: [
          //     ButtonDashGrid(
          //         title: "Gewete", color: Colors.orange, ico: Icons.euro),
          //     ButtonDashGrid(
          //         title: "Averias",
          //         ico: Icons.car_repair,
          //         color: Colors.red),
          //   ],
          //   secondRow: [
          //     ButtonDashGrid(
          //         title: "Repuestos",
          //         color: Colors.green,
          //         ico: Icons.speed),
          //     ButtonDashGrid(
          //         title: "Manteniminetos",
          //         ico: Icons.car_repair,
          //         color: Colors.lightBlue),
          //     ButtonDashGrid(
          //         title: "CheckList",
          //         ico: Icons.car_repair,
          //         color: Colors.purple),
          // ),
          // height: 0.30,
        ]),
      ),
      // SliverPadding(
      //   padding: const EdgeInsets.all(10),
      //   sliver: SliverToBoxAdapter(
      //     child: SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) {
      //           return const ButtonDashGrid(
      //               title: "Avisos",
      //               color: Colors.transparent,
      //               ico: Icons.speed);
      //         },
      //       ),
      //     ),
      //   ),
      // ),
    );
    //     // child: Center(
    //     //   child: StreamBuilder(
    //     //     stream: FirebaseFirestore.instance
    //     //         .collection("users")
    //     //         .doc(FirebaseAuth.instance.currentUser?.uid)
    //     //         .collection("ticket")
    //     //         .snapshots(),
    //     //     builder:
    //     //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     //       if (!snapshot.hasData) {
    //     //         return const Center(
    //     //           child: CircularProgressIndicator(),
    //     //         );
    //     //       }
    //     //       return Center(
    //     //         widthFactor: 5,
    //     //         child: ListView(
    //     //           children: [
    // ...snapshot.data!.docs
    //     .map(
    //       (e) => Card(
    //         child: SizedBox(
    //           height: MediaQuery.of(context).size.height / 7,
    //           width: MediaQuery.of(context).size.width / 1.3,
    //           child: ListTile(
    //             title: Text(e.id,
    //                 style: const TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 20.0,
    //                 )),
    //             subtitle: Text("${e.get("detalle")}"),
    //             trailing: e.get('priory') == 1
    //                 ? const Icon(
    //                     Icons.warning_amber,
    //                     color: Colors.redAccent,
    //                   )
    //                 : const Icon(
    //                     Icons.one_k_plus,
    //                     color: Colors.transparent,
    //                   ),
    //           ),
    //         ),
    //         elevation: 8,
    //         shadowColor: Colors.blue[50],
    //         margin: const EdgeInsets.only(
    //             left: 10.0, top: 5.0, right: 10.0, bottom: 3.0),
    //       ),
    //     )
    //     .toList(),
    //     //           ],
    //     //         ),
    //     //       );
    //     //     },
    //     //   ),
    //     // ),,
    //     child: ListView(
    //       children: [
    //         SizedBox(
    //           height: MediaQuery.of(context).size.height / 28,
    //         ),
    //         const CardMain(
    //           titulo: "Main DashBoard",
    //           subtitulo: "Cuerpo de texto",
    //         ),
    //         SizedBox(
    //           height: MediaQuery.of(context).size.height / 22,
    //         ),
    //         Row(
    //           children: const [
    //             CardInicial(titulo: "Gewete", subtitulo: "Salones"),
    //             CardInicial(titulo: "Averias", subtitulo: "Por salones")
    //           ],
    //         ),
    //         Row(
    //           children: const [
    //             CardInicial(titulo: "Rutas", subtitulo: "Por Salones"),
    //             CardInicial(titulo: "Rutas", subtitulo: "Por Salones"),
    //           ],
    //         )
    //       ],
    //     )),

    //     ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {}
    // {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const AddView(),
    //     ));
    // },
    //     ,
    //     child: const Icon(
    //       Icons.add,
    //       color: Colors.white,
    //     ),
    //   ),
    // );
  }

//===================================================
  SliverToBoxAdapter _buildHeader(double screenHeiht, String fecha) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Palette.primatyColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fecha,
                  style: Stylee.homeText,
                ),
                CircleAvatar(
                  radius: 15,
                  child: Image.asset('assets/images/logo.png'),
                  backgroundColor: Colors.transparent,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
