import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/net/flutterfire.dart';
import 'package:flutter_inicial_gewete/ui/widget/ButtomAveriasSalon.dart';
import '../../model/GeweteObj.dart';

class AveriasGrid extends StatefulWidget {
  const AveriasGrid({Key? key}) : super(key: key);

  @override
  State<AveriasGrid> createState() => _AveriasGridState();
}

class _AveriasGridState extends State<AveriasGrid> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.all(3),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
        ),
        FutureBuilder(
          future: listSalones(),
          builder:
              (BuildContext context, AsyncSnapshot<List<GeweteObject>> lis) {
            List<Widget> children = [];
            if (lis.hasData) {
              for (var item in lis.data!) {
                children.add(
                  ButtomAveriasSalon(
                    nombreSalon: item.nombre,
                  ),
                );
              }
              EasyLoading.dismiss();
            } else if (lis.hasError) {
              EasyLoading.showError("Error...");
            } else {
              EasyLoading.show(status: "Loading...");
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                ((context, index) => children[index]),
                childCount: children.length,
              ),
            );
          },
        )
      ],
    );
  }
}
