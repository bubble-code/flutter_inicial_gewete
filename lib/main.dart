import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inicial_gewete/provider/salon_provider.dart';
import 'package:flutter_inicial_gewete/ui/AveriasPage.dart';
import 'package:flutter_inicial_gewete/ui/addLocationSalon.dart';
import 'package:flutter_inicial_gewete/ui/authentication.dart';
import 'package:flutter_inicial_gewete/ui/gewetepage.dart';
import 'package:flutter_inicial_gewete/ui/home_page.dart';
import 'package:flutter_inicial_gewete/ui/avisosPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_inicial_gewete/net/geolocalitation/geo.dart';
import 'package:provider/provider.dart';
// import 'package:puppeteer/puppeteer.dart';

late LatLng _initialPosition;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _initialPosition = await getPosition();
  runApp(
    const InitialPage(),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SalonProvider>(
          create: (_) => SalonProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
          "gewete": (context) => const GewetePage(),
          "averias": (context) => const AveriasPage(),
          "avisos": (context) => const AvisosPage(),
          // "confSalon": (context) => const AddLocationSalon(),
        },
        builder: EasyLoading.init(),
      ),
    );
  }
}
