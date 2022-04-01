import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/model/DatosDeGewete.dart';
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

  Future<List<DatosDeGewete>> saldosGewetes() async {
    List<GeweteObject> tem2 = await listSalones();
    List<DatosDeGewete> listResult = [];
    for (var item in tem2) {
      ConnetionDB cc = ConnetionDB(item.ip, item.pass);
      Map<double, dynamic> datosGewete = <double, dynamic>{};
      await cc.connect();
      await cc.reader("query").then((value) {
        for (var ele in value) {
          datosGewete[ele['type']] = ele['value'];
        }
        listResult.add(DatosDeGewete(salon: item.nombre, valores: datosGewete));
      });
    }
    return listResult;
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
          ),
        ),
        FutureBuilder(
          future: saldosGewetes(),
          builder:
              (BuildContext context, AsyncSnapshot<List<DatosDeGewete>> el) {
            List<Widget> children = [];
            if (el.hasData) {
              for (var e in el.data!) {
                children.add(
                  ButtonGeweteGrid(
                    title: e.salon,
                    color: Colors.black54,
                    valores: e.valores,
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
          },
        ),
      ],
    );
  }
}
