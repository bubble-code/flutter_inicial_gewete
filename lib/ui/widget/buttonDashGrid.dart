import 'package:flutter/material.dart';
import '../../config/Style.dart';

class ButtonDashGrid extends StatelessWidget {
  final String title;
  late final double height;
  late final double widt;
  // final IconData ico;
  // final Color color;
  ButtonDashGrid({
    Key? key,
    required this.title,
    double heigh = 5,
    double width = 120,
  }) : super(key: key) {
    height = heigh;
    widt = width;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, title.toLowerCase());
      },
      child: Container(
        height: height,
        width: widt,
        margin: const EdgeInsets.all(8),
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: Text(title, style: Stylee.chartLabelTextStyle)),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   // crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [Text(title, style: Stylee.deshStyleTitle), Icon(ico)],
        // ),
      ),
    );
  }
}
