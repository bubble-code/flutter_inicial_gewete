import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/model/GeweteObj.dart';

import '../../net/DBSql/Connection.dart';
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

  Future<List<GeweteObject>> saldosGewetes() async {
    List<GeweteObject> tem = await listSalones();
    List<GeweteObject> tem2 = [];

    tem.map((e) {
      ConnetionDB cc = ConnetionDB(e.ip, e.pass);
      cc.connect().then((_) => cc.reader("query")).then((value) {
        tem2.add(
          GeweteObject(
            ip: "",
            nombre: "",
            pass: "",
          ),
        );
        debugPrint(value.toString());
      });
    });
    return tem2;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.all(3),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
            ),
            // child:
            //  Column(
            //   children: [
            //     const SizedBox(
            //       height: 150,
            //     ),
            // Container(
            //   padding: const EdgeInsets.all(5),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(6),
            //       color: Colors.black.withOpacity(0.2),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withOpacity(0.1),
            //           offset: const Offset(0.2, 15),
            //           blurRadius: 10,
            //         ),
            //       ]),
            //   height: MediaQuery.of(context).size.height,
            // child:

            // ],
            // ),
          ),
        ),
        FutureBuilder(
          future: saldosGewetes(),
          builder:
              (BuildContext context, AsyncSnapshot<List<GeweteObject>> el) {
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
              EasyLoading.dismiss();
            } else if (el.hasError) {
              EasyLoading.showError("Failes whit error");
            } else {
              EasyLoading.show(status: "loading..");
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return children[index];
                },
                childCount: children.length,
              ),
            );
            // return GridView.extent(
            //   maxCrossAxisExtent: 150,
            //   padding: const EdgeInsets.all(4),
            //   mainAxisSpacing: 4,
            //   crossAxisSpacing: 4,
            //   children: [...children],
          },
        ),
      ],
    );
  }
}
