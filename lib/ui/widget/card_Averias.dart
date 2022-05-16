import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Card_Averias extends StatefulWidget {
  final String title;
  const Card_Averias({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<Card_Averias> createState() => _Card_AveriasState();
}

class _Card_AveriasState extends State<Card_Averias> {
  @override
  void initState() {
    super.initState();
    final averiaSalon = Provider.of<SalonProvider>(context, listen: false);
    averiaSalon.getDetailAverias(widget.title, "Madrid");
  }

  @override
  Widget build(BuildContext context) {
    final currentAveriasSalon = Provider.of<SalonProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 14, right: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // height: 135,
      decoration: BoxDecoration(
          color: Color.fromARGB(12, 2, 15, 252),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
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
            margin: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.rajdhani(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[200],
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
                    Text(
                      currentAveriasSalon.averias_salon.isEmpty
                          ? "Nada"
                          : currentAveriasSalon.averias_salon.length.toString(),
                      style: GoogleFonts.rajdhani(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Arrow de detalles de la card
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_right,
                size: 35,
                color: Colors.amber,
              ),
            ),
          )
        ],
      ),
    );
  }
}
