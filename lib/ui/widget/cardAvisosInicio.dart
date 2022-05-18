import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAvisos extends StatelessWidget {
  final String titulo, detalles, fecha;
  const CardAvisos({
    Key? key,
    required this.titulo,
    required this.detalles,
    required this.fecha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 14, right: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 135,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 250, 233),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Icono de la card
          Container(
            margin: EdgeInsets.only(left: 15, top: 10),
            child: const Icon(Icons.calendar_today),
          ),
          //Text de la card
          Container(
            width: MediaQuery.of(context).size.width * 1 / 2,
            margin: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
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
                      detalles,
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
