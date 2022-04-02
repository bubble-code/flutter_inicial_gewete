import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/net/TicketNet/TicketLogin.dart';

import '../../net/TicketNet/TicketScraper.dart';

class ButtomAveriasSalon extends StatefulWidget {
  final String nombreSalon;
  // final Map<double, dynamic> valores;
  // final Color color;

  const ButtomAveriasSalon({
    Key? key,
    required this.nombreSalon,
    // required this.color,
    // required this.valores,
  }) : super(key: key);

  @override
  State<ButtomAveriasSalon> createState() => _ButtomAveriasSalonState();
}

class _ButtomAveriasSalonState extends State<ButtomAveriasSalon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() async {
        var tem = await TicketLogin().isLogin();
        debugPrint(tem.toString());
      }),
      // onTap: () async {
      //   await TickecScrapper(pass: "", url: "", username: "").inicial();
      //   // List<dynamic> resulty = [];
      //   //  ConnetionDB cc = ConnetionDB(widget.ip, widget.passw);
      // },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.nombreSalon,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [...result],
            // ),
          ],
        ),
      ),
    );
  }
}
