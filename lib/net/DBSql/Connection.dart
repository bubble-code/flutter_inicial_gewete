import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/model/Stock.dart';
import 'package:sql_conn/sql_conn.dart';
import 'dart:async';

class ConnetionDB {
  final String ipp, pass;
  ConnetionDB(this.ipp, this.pass);
  Future<void> connect() async {
    //debugPrint("Connecting...");
    try {
      await SqlConn.connect(
          ip: ipp,
          port: "51304",
          databaseName: "SIRIUS",
          username: "logs",
          password: pass);
      debugPrint("Connected");
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      // Navigator.pop(context);
    }
  }

  Future<List<dynamic>> reader(String query) async {
    return await const JsonDecoder().convert(await SqlConn.readData(
        "SELECT CAST(LCR_DENOMINATION_VALUE AS FLOAT) AS type, SUM(LCR_STOCK) AS cant,CAST(LCR_DENOMINATION_VALUE AS FLOAT) * SUM(LCR_STOCK) AS value FROM LOG_CURRENT_LEVEL WHERE LCR_STOCK > 0 AND LCR_SHELF_CHANNEL_TYPE <> 'input' GROUP BY LCR_DENOMINATION_VALUE ORDER BY LCR_DENOMINATION_VALUE DESC"));
  }
}
