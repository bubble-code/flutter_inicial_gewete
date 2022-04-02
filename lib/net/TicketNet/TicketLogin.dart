import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class TicketLogin {
  Future<bool> isLogin() async {
    bool tt = false;
    var url = Uri.parse("http://otrs.dosniha.eu/osticket/scp/login");
    // var url = Uri.parse("https://www.google.com");
    // HttpURLConn
    Map<String, String> headers = {
      "Connection": "keep-alive",
      "Upgrade-Insecure-Requests": "1",
      "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36",
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
      "Accept-Encoding": "gzip, deflate",
      "Accept-Language": "es-ES,es;q=0.9",
      "Cookie": "OSTSESSID=b33612bee7eeb65d96594f24eff99a2c"
    };
    var response = await http.Client().get(url, headers: headers);

    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      try {
        debugPrint(document.getElementsByTagName('input')[0].outerHtml);
        tt = true;
      } catch (e) {
        debugPrint("Error");
        tt = false;
      }
    }
    return tt;
  }
}
