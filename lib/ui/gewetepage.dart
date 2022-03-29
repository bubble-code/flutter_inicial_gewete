import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import 'package:flutter_inicial_gewete/ui/widget/custom_app_bar.dart';
import 'package:flutter_inicial_gewete/ui/widget/geweteGrid.dart';

class GewetePage extends StatefulWidget {
  const GewetePage({Key? key}) : super(key: key);

  @override
  State<GewetePage> createState() => _GewetePageState();
}

class _GewetePageState extends State<GewetePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Estados de GEWETES",
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Palette.primatyColor,
          image: DecorationImage(
              image: Image.asset('assets/images/fondoMain.jpg').image,
              fit: BoxFit.cover),
        ),
        child: GeweteGrid(),
      ),
    );
  }
}
