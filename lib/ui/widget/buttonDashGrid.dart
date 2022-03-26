import 'package:flutter/material.dart';
import '../../config/Style.dart';

class ButtonDashGrid extends StatelessWidget {
  final String title;
  final IconData ico;
  final Color color;
  const ButtonDashGrid({
    Key? key,
    required this.title,
    required this.ico,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, title.toLowerCase());
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(title, style: Stylee.deshStyleTitle), Icon(ico)],
          ),
        ),
      ),
    );
  }
}
