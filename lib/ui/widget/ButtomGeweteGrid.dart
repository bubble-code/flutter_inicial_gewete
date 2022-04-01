import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/model/Stock.dart';
import 'package:flutter_inicial_gewete/net/DBSql/Connection.dart';
import '../../config/Style.dart';

class ButtonGeweteGrid extends StatefulWidget {
  final String title;
  final Map<double, dynamic> valores;
  final Color color;

  const ButtonGeweteGrid({
    Key? key,
    required this.title,
    required this.color,
    required this.valores,
  }) : super(key: key);

  @override
  State<ButtonGeweteGrid> createState() => _ButtonGeweteGridState();
}

class _ButtonGeweteGridState extends State<ButtonGeweteGrid> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback(
  //     (_) {
  //       ConnetionDB cc = ConnetionDB(widget.ip, widget.passw);
  //       cc.connect().then((_) => cc.reader("query")).then(
  //         (value) {
  //           debugPrint(value.toString());
  //           // debugPrint("${value[0]['type'].toString()}-- ");
  //           // veint = value[1]['type'].toString();
  //           // diez = value[2]['type'].toString();

  //           debugPrint(value[0]['type'].toString());
  //           debugPrint(value[0]['value'].toString());
  //           // debugPrint(value[0]['type'].toString());
  //           // showDialog(
  //           //   context: context,
  //           //   builder: (context) => AlertDialog(
  //           //     title: Text(
  //           //       value[0]['type'].toString(),
  //           //     ),
  //           //     content: Row(
  //           //       children: [Text(value[0]['value'].toString())],
  //           //     ),
  //           //   ),
  //           // );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> result = [];
    widget.valores.forEach((key, value) {
      result.add(
        Container(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, right: 3.0, left: 3.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white54,
          ),
          child: Column(
            children: [
              Text(
                key.toStringAsFixed(2),
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              Text(
                value.toStringAsFixed(2),
                style: const TextStyle(fontSize: 10.0),
              ),
            ],
          ),
        ),
      );
    });
    return InkWell(
      onTap: () {
        // List<dynamic> resulty = [];
        //  ConnetionDB cc = ConnetionDB(widget.ip, widget.passw);
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5),
        height: 130,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [...result],
            ),
          ],
        ),
      ),
    );
  }
}
