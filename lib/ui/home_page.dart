// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import 'package:flutter_inicial_gewete/config/Style.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttonDashGrid.dart';
// import 'package:flutter_inicial_gewete/ui/addLocationSalon.dart';
// import 'package:flutter_inicial_gewete/ui/widget/cardMain.dart';
// import 'package:flutter_inicial_gewete/ui/widget/cardMy.dart';
import 'package:flutter_inicial_gewete/ui/widget/custom_app_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_inicial_gewete/ui/widget/dashGrid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final fecha = formatDate(DateTime.now(), [DD, ' ', dd, '-', mm]);
    return Scaffold(
      appBar: const CustomAppBar(title: "Main Dash Board "),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/images/fondoMain.jpg').image,
              fit: BoxFit.cover),
        ),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            _buildHeader(screenHeight, fecha),
            const SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverToBoxAdapter(
                child: DashGrid(
                  firstRow: [
                    ButtonDashGrid(
                        title: "Gewete", color: Colors.orange, ico: Icons.euro),
                    ButtonDashGrid(
                        title: "Averias",
                        ico: Icons.car_repair,
                        color: Colors.red),
                  ],
                  secondRow: [
                    ButtonDashGrid(
                        title: "Repuestos",
                        color: Colors.green,
                        ico: Icons.speed),
                    ButtonDashGrid(
                        title: "Manteniminetos",
                        ico: Icons.car_repair,
                        color: Colors.lightBlue),
                    ButtonDashGrid(
                        title: "CheckList",
                        ico: Icons.car_repair,
                        color: Colors.purple),
                  ],
                  height: 0.30,
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverToBoxAdapter(
                child: DashGrid(
                  firstRow: [
                    ButtonDashGrid(
                        title: "Repuestos",
                        color: Colors.transparent,
                        ico: Icons.speed),
                  ],
                  secondRow: [],
                  height: 0.44,
                ),
              ),
            )
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}
        // {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const AddView(),
        //     ));
        // },
        ,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
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
