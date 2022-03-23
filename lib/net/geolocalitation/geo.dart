import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

Future<LatLng> getPosition() async {
  final Location location = Location();
  if (!await location.serviceEnabled()) {
    if (!await location.requestService()) throw 'GPS service is desabled';
  }
  if (await location.hasPermission() == PermissionStatus.denied) {
    if (await location.requestPermission() != PermissionStatus.granted) {
      throw 'No GPS permissions';
    }
  }
  final LocationData data = await location.getLocation();
  return LatLng(data.latitude!, data.longitude!);
}
