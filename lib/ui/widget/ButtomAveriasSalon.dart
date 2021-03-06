import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/net/TicketNet/TicketLogin.dart';
import 'package:flutter_inicial_gewete/net/flutterfire.dart';

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
        // var tem = await TicketLogin().isLogin();
        // debugPrint(tem.toString());
        await listAverias(widget.nombreSalon);
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
            FittedBox(
              child: Text(
                widget.nombreSalon,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder(
              future: listAverias(widget.nombreSalon),
              builder: (BuildContext context, AsyncSnapshot<int> cant) {
                return cant.data == 0
                    ? SafeArea(child: Container())
                    : SafeArea(
                        child: Positioned(
                          right: 11,
                          top: 11,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6)),
                            constraints: const BoxConstraints(
                              minHeight: 14,
                              minWidth: 14,
                            ),
                            child: Center(
                              child: Text(
                                cant.data.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              },
            )
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
