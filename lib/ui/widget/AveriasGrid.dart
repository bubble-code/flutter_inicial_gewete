import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/net/flutterfire.dart';
import 'package:flutter_inicial_gewete/ui/widget/ButtomAveriasSalon.dart';
import '../../model/GeweteObj.dart';
import 'package:flutter_inicial_gewete/ui/widget/card_Averias.dart';

class AveriasGrid extends StatefulWidget {
  const AveriasGrid({Key? key}) : super(key: key);

  @override
  State<AveriasGrid> createState() => _AveriasGridState();
}

class _AveriasGridState extends State<AveriasGrid> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listSalones("Madrid"),
      builder: (BuildContext context, AsyncSnapshot<List<Salon>> lis) {
        List<Widget> children = [];
        if (lis.hasData) {
          for (var item in lis.data!) {
            // children.add(
            //   Card_Averias(
            //     title: item.nombre,
            //   ),
            // );
          }
          EasyLoading.dismiss();
        } else if (lis.hasError) {
          EasyLoading.showError("Error...");
        } else {
          EasyLoading.show(status: "Loading...");
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
