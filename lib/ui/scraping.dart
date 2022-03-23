import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:puppeteer/puppeteer.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class Scraper extends StatelessWidget {
  // const Scraper({ Key? key }) : super(key: key);
  void openWeb() async {
    // var chromium = await downloadChrome(
    //   cachePath: path.join(Platform.environment['HOME']!, 'chromium-puppeteer'),
    // );

    var browser = await puppeteer.launch(
      // executablePath: chromium.executablePath,
      headless: false,
    );
    var myPage = browser.newPage().then((page) => {
          print('page open'),
          page
              .goto('http://otrs.dosniha.eu/osticket/scp/login.php',
                  wait: Until.networkIdle)
              .then((value) => {print('Pagina Cargada')}),
        });
    browser.close();
    // goto('http://otrs.dosniha.eu/osticket/scp/login.php',
    // wait: Until.networkIdle);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
