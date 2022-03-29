import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/model/GeweteObj.dart';

import 'ButtomGeweteGrid.dart';

class GeweteGrid extends StatefulWidget {
  const GeweteGrid({Key? key}) : super(key: key);

  @override
  State<GeweteGrid> createState() => _GeweteGridState();
}

class _GeweteGridState extends State<GeweteGrid> {
  // List<GeweteObject> lista = [];
  Future<List<GeweteObject>> listSalones() async {
    List<GeweteObject> lista = [];
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("salones")
        .get()
        .then((value) => value.docs.forEach((element) {
              lista.add(GeweteObject(
                  ip: element.get("ip"),
                  nombre: element.id,
                  pass: element.get("pass")));
            }));
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      // decoration: ,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(3),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black.withOpacity(0.2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0.2, 15),
                            blurRadius: 10,
                          ),
                        ]),
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                      future: listSalones(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<GeweteObject>> el) {
                        List<Widget> children = [];
                        if (el.hasData) {
                          for (var e in el.data!) {
                            children.add(
                              ButtonGeweteGrid(
                                title: e.nombre,
                                color: Colors.lightGreen,
                                ip: e.ip,
                                passw: e.pass,
                              ),
                            );
                          }
                        } else if (el.hasError) {
                          children = <Widget>[
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text('Error: ${el.error}'),
                            )
                          ];
                        } else {
                          children = const <Widget>[
                            SizedBox(
                              child: CircularProgressIndicator(),
                              width: 60,
                              height: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text('Awaiting result...'),
                            )
                          ];
                        }
                        return GridView.extent(
                          maxCrossAxisExtent: 150,
                          padding: const EdgeInsets.all(4),
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          children: [...children],
                        );
                        //  Center(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: children,
                        //   ),
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )

          // stream:
          // stream: FirebaseFirestore.instance
          //     .collection("users")
          //     .doc(FirebaseAuth.instance.currentUser?.email)
          //     .collection("salones")
          //     .snapshots(),
          // itemBuilder: (
          //   context,
          // ) {
          //   return snapshot.hasData
          //       ? SliverToBoxAdapter(
          //           // widthFactor: 5,
          //           child: ListView(
          //             children: [
          //               ...snapshot.data!.docs.map((e) => CardInicial(
          //                     titulo: e.id.toUpperCase(),
          //                     subtitulo: e.get('ip'),
          //                     functionCard: () {},
          //                   ))
          //             ],
          //           ),
          //         )
          //       : const Center(
          //           child: CircularProgressIndicator(),
          //         );
          // },
          // ),
        ],
      ),
    );
    // FloatingActionButton(
    //   onPressed: () {
    //     listSalones().then((e) {
    //       e.forEach((he) {
    //         print(he.nombre);
    //       });
    //     });
    //   },
    //   child: const Icon(
    //     Icons.add,
    //     color: Colors.white,
    //   ),
    // ),
    // ],
    // );
  }
}
