import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/Averias/AveriasModel.dart';

class CardDetailsAverias extends StatefulWidget {
  // final String title;
  final Map<String, List<AveriasObject>> faultsHall;
  const CardDetailsAverias({
    Key? key,
    // required this.title,
    required this.faultsHall,
  }) : super(key: key);

  @override
  State<CardDetailsAverias> createState() => _CardDetailsAveriasState();
}

class _CardDetailsAveriasState extends State<CardDetailsAverias> {
  // @override
  // void initState() {
  //   super.initState();
  //   final averiaSalon = Provider.of<SalonProvider>(context, listen: false);
  //   averiaSalon.getDetailAverias(widget.title, "Madrid");
  // }

  @override
  Widget build(BuildContext context) {
    // final currentAveriasSalon = Provider.of<SalonProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 14, right: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 135,
      decoration: BoxDecoration(
        color: Color.fromARGB(26, 133, 135, 155),
        border: Border.all(color: Color.fromARGB(26, 133, 135, 155)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 2 / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width * 1 / 2,
                      margin: EdgeInsets.only(left: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // widget.title,
                            widget.faultsHall.values.first[0].subject
                                .replaceFirst("\n", "")
                                .trim(),
                            style: GoogleFonts.rajdhani(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  alignment: Alignment.centerLeft,
                  child: Divider(
                    color: Colors.amber[700],
                  ),
                ),
                ...listaSubjectAverias(widget.faultsHall.values.first),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> listaSubjectAverias(List<AveriasObject>? lis) {
  List<Widget> result = [];
  for (var item in lis!) {
    result.add(
      Container(
        margin: const EdgeInsets.only(left: 10, right: 6),
        child: Text(
          item.subject.replaceFirst("\n", "").trim(),
          style: GoogleFonts.rajdhani(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
  return result;
}
