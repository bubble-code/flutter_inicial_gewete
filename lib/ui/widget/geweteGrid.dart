import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/model/DatosDeGewete.dart';
import 'package:flutter_inicial_gewete/model/GeweteObj.dart';
import 'package:flutter_inicial_gewete/net/flutterfire.dart';
import '../../net/DBSql/Connection.dart';
import 'ButtomGeweteGrid.dart';

class GeweteGrid extends StatefulWidget {
  const GeweteGrid({Key? key}) : super(key: key);

  @override
  State<GeweteGrid> createState() => _GeweteGridState();
}

class _GeweteGridState extends State<GeweteGrid> {
  Future<List<DatosDeGewete>> saldosGewetes() async {
    List<Salon> tem2 = await listSalones("Madrid");
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
    return Column(
      children: [
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ],
    );
  }
}
