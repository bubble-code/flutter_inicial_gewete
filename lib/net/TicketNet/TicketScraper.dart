import 'package:flutter/cupertino.dart';
import 'package:puppeteer/puppeteer.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class TickecScrapper {
  final String url, username, pass;
  TickecScrapper(
      {required this.url, required this.pass, required this.username});

  Future inicial() async {
    var chromium = await downloadChrome(
      // Use a path where you have write access
      cachePath: path.join(Platform.environment['HOME']!, 'chromium-puppeteer'),
    );
    var browser = await puppeteer.launch(
        headless: false, executablePath: chromium.executablePath);
    var myPage = await browser.newPage();
    await myPage.goto("http://otrs.dosniha.eu/osticket/scp/login.php",
        wait: Until.networkIdle);
    final title = await myPage.evaluate('()=> document.title');
    debugPrint(title);
    await browser.close();
  }
}
