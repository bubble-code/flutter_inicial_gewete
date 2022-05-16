import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:provider/provider.dart';
import '../../config/Style.dart';

class ButtonDashGrid extends StatefulWidget {
  final String title;
  late final double height;
  late final double widt;
  late final int total;
  // final Color color;
  ButtonDashGrid({
    Key? key,
    required this.title,
    double heigh = 5,
    double width = 120,
    int total = 0,
  }) : super(key: key) {
    height = heigh;
    widt = width;
    total = total;
  }

  @override
  State<ButtonDashGrid> createState() => _ButtonDashGridState();
}

class _ButtonDashGridState extends State<ButtonDashGrid> {
  @override
  void initState() {
    super.initState();
    final salones = Provider.of<SalonProvider>(context, listen: false);
    salones.getTotalAverias(salones.listResult);
    // Stream<int> stream =
    //     Stream.fromFuture(salones.getTotalAverias(salones.listResult));
    // stream.listen((event) {
    //   print("Data recivida :" + event.toString());
    // }, onDone: () {
    //   print("Task Done");
    // }, onError: () {
    //   print("Task Error");
    // });
  }

  @override
  Widget build(BuildContext context) {
    final totalaver = Provider.of<SalonProvider>(context, listen: true);
    return InkWell(
      onTap: () {
        totalaver.getTotalAverias(totalaver.listResult);
        Navigator.pushNamed(context, widget.title.toLowerCase());
      },
      child: Container(
        height: widget.height,
        width: widget.widt,
        margin: const EdgeInsets.all(8),
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Center(
              child: Text(widget.title, style: Stylee.chartLabelTextStyle),
            ),
            Container(
              child: totalaver.salones != 0
                  ? Text(totalaver.totalAveria.toString())
                  : Container(),
            ),
          ],
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   // crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [Text(title, style: Stylee.deshStyleTitle), Icon(ico)],
        // ),
      ),
    );
  }
}
