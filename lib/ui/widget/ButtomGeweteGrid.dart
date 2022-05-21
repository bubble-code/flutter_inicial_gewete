import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/model/gewete_series.dart';
import 'package:flutter_inicial_gewete/ui/widget/chart_data_gwt.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money2/money2.dart';
import 'package:decimal/decimal.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ButtonGeweteGrid extends StatefulWidget {
  final String title;
  final Map<double, dynamic> valores;
  final Color color;

  const ButtonGeweteGrid({
    Key? key,
    required this.title,
    required this.color,
    required this.valores,
  }) : super(key: key);

  @override
  State<ButtonGeweteGrid> createState() => _ButtonGeweteGridState();
}

class _ButtonGeweteGridState extends State<ButtonGeweteGrid> {
  final List<GeweteSeries> datas = [];
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback(
  //     (_) {
  //       ConnetionDB cc = ConnetionDB(widget.ip, widget.passw);
  //       cc.connect().then((_) => cc.reader("query")).then(
  //         (value) {
  //           debugPrint(value.toString());
  //           // debugPrint("${value[0]['type'].toString()}-- ");
  //           // veint = value[1]['type'].toString();
  //           // diez = value[2]['type'].toString();

  //           debugPrint(value[0]['type'].toString());
  //           debugPrint(value[0]['value'].toString());
  //           // debugPrint(value[0]['type'].toString());
  //           // showDialog(
  //           //   context: context,
  //           //   builder: (context) => AlertDialog(
  //           //     title: Text(
  //           //       value[0]['type'].toString(),
  //           //     ),
  //           //     content: Row(
  //           //       children: [Text(value[0]['value'].toString())],
  //           //     ),
  //           //   ),
  //           // );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> result = [];
    double total = 0.0;
    Color colorr;
    widget.valores.forEach((key, value) {
      total += value;
      // datas.add(
      //   GeweteSeries(
      //     cant: value,
      //     type: key,
      //   ),
      // );
      switch (key.toStringAsFixed(2)) {
        case '10.00':
          colorr = value < 500.0
              ? const Color.fromARGB(255, 249, 115, 105)
              : Colors.black45;
          break;
        case '20.00':
          colorr = value < 5000.0
              ? const Color.fromARGB(255, 249, 115, 105)
              : Colors.black45;
          break;
        case '50.00':
          colorr = value < 7000.0
              ? const Color.fromARGB(255, 249, 115, 105)
              : Colors.black45;
          break;
        case '1.00':
          colorr = value < 500.0
              ? const Color.fromARGB(255, 249, 115, 105)
              : Colors.black45;
          break;
        default:
          colorr = Colors.black45;
      }
      result.add(
        Container(
          // padding: const EdgeInsets.only(
          //     top: 16.0, bottom: 16.0, right: 3.0, left: 3.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white54,
          ),
          child: Row(
            children: [
              Container(
                width: 30,
                child: Text(
                  Money.fromDecimal(Decimal.parse(key.toString()), code: 'EUR')
                      .format(r'##.##,##'),
                  style: GoogleFonts.rajdhani(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 3, right: 6),
                width: MediaQuery.of(context).size.width * 1 / 3,
                alignment: Alignment.centerLeft,
                child: Divider(
                  color: Colors.amber[700],
                ),
              ),
              Text(
                Money.fromDecimal(Decimal.parse(value.toString()), code: 'EUR')
                        .format(r'##.###,##') +
                    " €",
                style: GoogleFonts.rajdhani(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorr,
                ),
              ),
            ],
          ),
        ),
      );
    });
    return
        // InkWell(
        //   onTap: () {
        //     // List<dynamic> resulty = [];
        //     //  ConnetionDB cc = ConnetionDB(widget.ip, widget.passw);
        //   },
        //   child:
        Container(
      margin: const EdgeInsets.only(top: 10, left: 14, right: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // height: 130,
      decoration: BoxDecoration(
        // color: widget.color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 2 / 3,
            margin: const EdgeInsets.only(left: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.rajdhani(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.start,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    " " +
                        Money.fromDecimal(Decimal.parse(total.toString()),
                                code: 'EUR')
                            .format(r"###.###,##")
                            .toString() +
                        " € ",
                    // " € " + total.toStringAsFixed(2) + " ",
                    style: GoogleFonts.rajdhani(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            alignment: Alignment.centerLeft,
            child: Divider(
              color: Colors.amber[700],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...result],
            // CharDataGWT(data: datas),
            // ],
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [...result],
          // ),
        ],
      ),
    );
    // );
  }
}
