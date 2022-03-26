import 'package:flutter/material.dart';

class DashGrid extends StatelessWidget {
  final List<Widget> firstRow, secondRow;
  final double height;
  const DashGrid(
      {Key? key,
      required this.firstRow,
      required this.secondRow,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.black.withOpacity(0.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0.2, 15),
              blurRadius: 10,
            ),
          ]),
      height: MediaQuery.of(context).size.height * height,
      // color: Palette.primatyColor,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [...firstRow],
            ),
          ),
          secondRow.isNotEmpty
              ? Flexible(
                  child: Row(
                    children: [...secondRow],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
