import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/model/Stock.dart';
import 'package:flutter_inicial_gewete/net/DBSql/Connection.dart';
import '../../config/Style.dart';

class ButtonGeweteGrid extends StatelessWidget {
  final String title, ip, passw;
  final Color color;

  const ButtonGeweteGrid(
      {Key? key,
      required this.title,
      required this.color,
      required this.ip,
      required this.passw})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        List<dynamic> resulty = [];
        ConnetionDB cc = ConnetionDB(ip, passw);
        cc.connect().then((_) => cc.reader("query")).then((value) {
          // resulty.add(value);
          debugPrint(value[0]['type'].toString());
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                value[0]['type'].toString(),
              ),
              content: Row(
                children: [Text(value[0]['value'].toString())],
              ),
            ),
          );
        });
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Stylee.deshStyleTitle),
          ],
        ),
      ),
    );
  }
}
