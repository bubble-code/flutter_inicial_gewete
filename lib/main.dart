import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/ui/addLocationSalon.dart';
import 'package:flutter_inicial_gewete/ui/authentication.dart';
import 'package:flutter_inicial_gewete/ui/home_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_inicial_gewete/net/geolocalitation/geo.dart';
// import 'package:puppeteer/puppeteer.dart';

late LatLng _initialPosition;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _initialPosition = await getPosition();
  runApp(const MaterialApp(
    home: InitialPage(),
  ));
}

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        title: 'Merkur Tecnicos',
        // home: Authentication(),
        initialRoute: 'login',
        routes: {
          "login": (context) => const Authentication(),
          "home": (context) => const HomePage(),
          "confSalon": (context) => const AddLocationSalon(),
        });
  }
}
