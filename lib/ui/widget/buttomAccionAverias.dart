import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../config/Style.dart';

class AccionAverias extends StatefulWidget {
  final String title;
  late final double height;
  late final double widt;
  late final int total;
  // final Color color;
  AccionAverias({
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
  State<AccionAverias> createState() => _AccionAveriasState();
}

class _AccionAveriasState extends State<AccionAverias> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, widget.title.toLowerCase());
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rajdhani(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
