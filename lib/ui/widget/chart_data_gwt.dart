import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/model/gewete_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:decimal/decimal.dart';
import 'package:money2/money2.dart';

class CharDataGWT extends StatelessWidget {
  final List<GeweteSeries> data;

  const CharDataGWT({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<GeweteSeries, String>> series = [
      charts.Series(
        id: "Saldo",
        data: data,
        domainFn: (GeweteSeries series, _) {
          // return series.type.toStringAsFixed(2);
          return Money.fromDecimal(Decimal.parse(series.type.toString()),
                  code: 'EUR')
              .format(r'##.##,##');
        },
        measureFn: (GeweteSeries series, _) => series.cant,
        colorFn: (GeweteSeries series, _) {
          switch (series.type.toStringAsFixed(2)) {
            case '10.00':
              return series.cant < 500.0
                  ? charts.ColorUtil.fromDartColor(
                      const Color.fromARGB(255, 249, 115, 105))
                  : charts.ColorUtil.fromDartColor(
                      const Color.fromARGB(255, 117, 193, 255));
            case '20.00':
              return series.cant < 5000.0
                  ? charts.ColorUtil.fromDartColor(
                      const Color.fromARGB(255, 249, 115, 105))
                  : charts.ColorUtil.fromDartColor(
                      const Color.fromARGB(255, 117, 193, 255));
            case '50.00':
              return series.cant < 7000.0
                  ? charts.ColorUtil.fromDartColor(
                      const Color.fromARGB(255, 249, 115, 105))
                  : charts.ColorUtil.fromDartColor(
                      const Color.fromARGB(255, 117, 193, 255));
            case '1.00':
              return series.cant < 500.0
                  ? charts.ColorUtil.fromDartColor(
                      const Color.fromARGB(255, 249, 115, 105))
                  : charts.ColorUtil.fromDartColor(
                      const Color.fromARGB(255, 117, 193, 255));
            default:
              return charts.ColorUtil.fromDartColor(Colors.blue);
          }
        },
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
    // charts.BarChart();
  }
}
