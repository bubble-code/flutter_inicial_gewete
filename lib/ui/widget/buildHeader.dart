import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import 'package:flutter_inicial_gewete/config/Style.dart';

class BuildHeadert extends StatelessWidget {
  const BuildHeadert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Palette.primatyColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "Hola Alejandro",
                style: Stylee.homeText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
