import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/Averias/AveriasModel.dart';

class Card_Averias extends StatefulWidget {
  // final String title;
  final Map<String, List<AveriasObject>> faultsHall;
  const Card_Averias({
    Key? key,
    // required this.title,
    required this.faultsHall,
  }) : super(key: key);

  @override
  State<Card_Averias> createState() => _Card_AveriasState();
}

class _Card_AveriasState extends State<Card_Averias> {
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
      // height: 135,
      decoration: BoxDecoration(
        //color: Color.fromARGB(12, 2, 15, 252),
        // border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Icono de la card
              // Container(
              //   margin: EdgeInsets.only(left: 15, top: 10),
              //   child: const Icon(Icons.calendar_today),
              // ),
              //Text de la card
              Container(
                width: MediaQuery.of(context).size.width * 1 / 2,
                margin: EdgeInsets.only(left: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // widget.title,
                      widget.faultsHall.keys.first,
                      style: GoogleFonts.rajdhani(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 20,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber[50],
                          radius: 8,
                          child: FittedBox(
                            child: Text(
                              widget.faultsHall.values.first.length.toString(),
                              // currentAveriasSalon
                              //         .averias_salon[widget.title]!.isEmpty
                              //     ? "0"
                              //     : currentAveriasSalon
                              //         .averias_salon[widget.title]!.length
                              //         .toString(),
                              style: GoogleFonts.rajdhani(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Arrow de detalles de la card
              Container(
                height: 15,
                margin: const EdgeInsets.only(left: 70, top: 3),
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(7)),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "averiasDetail", arguments: {
                      "salon": widget.faultsHall.keys.first,
                    });
                  },
                  child: Text(
                    "  Detalles  ",
                    style: GoogleFonts.rajdhani(
                      fontSize: 12,
                      color: Colors.green[500],
                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
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
    );
  }
}

List<Widget> listaSubjectAverias(List<AveriasObject>? lis) {
  List<Widget> result = [];
  for (var item in lis!) {
    result.add(
      Text(
        item.subject,
        style: GoogleFonts.rajdhani(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
  return result;
}
