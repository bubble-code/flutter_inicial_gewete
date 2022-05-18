import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../config/Style.dart';

class ButtonInicioAverias extends StatefulWidget {
  final String title;
  late final double height;
  late final double widt;
  late final int total;
  // final Color color;
  ButtonInicioAverias({
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
  State<ButtonInicioAverias> createState() => _ButtonInicioAveriasState();
}

class _ButtonInicioAveriasState extends State<ButtonInicioAverias> {
  @override
  void initState() {
    super.initState();
    final salones = Provider.of<SalonProvider>(context, listen: false);
    salones.getTotalAverias(salones.listResult);
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
        // margin: const EdgeInsets.all(8),
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Center(
              child: Text(
                widget.title,
                style: GoogleFonts.rajdhani(
                    fontSize: 16,
                    color: Colors.blue[300],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15, left: 0),
              child: totalaver.salones.isNotEmpty
                  ? Text(
                      totalaver.totalAveria.toString(),
                      style: GoogleFonts.rajdhani(
                          fontSize: 16,
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "0",
                      style: GoogleFonts.rajdhani(
                          fontSize: 16,
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold),
                    ),
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
