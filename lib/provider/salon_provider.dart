import 'package:flutter/cupertino.dart';
import 'package:flutter_inicial_gewete/model/Averias/AveriasModel.dart';
import 'package:flutter_inicial_gewete/model/GeweteObj.dart';
import 'package:flutter_inicial_gewete/net/flutterfire.dart';

import '../model/SalonesModel.dart';

class SalonProvider extends ChangeNotifier {
  List<Salon> salones = [];
  List<NameSalon> listResult = [];
  List<AveriasObject> averias_salon = [];
  bool loading = false;
  int totalAveria = 0;
  addSalon() {}

  getSalon(String comunidad) async {
    loading = true;
    salones = await listSalones(comunidad);
    for (var item in salones) {
      listResult.add(NameSalon(
        salon: item.nombre,
      ));
    }
    loading = false;
    notifyListeners();
  }

  deleteSalon() {}
  editSalon() {}
  getTotalAverias(List<NameSalon> llist) async {
    totalAveria = await totalAverias(llist);
    notifyListeners();
  }

  getDetailAverias(String salon, String comunidad) async {
    averias_salon = await averiasDelSalon(salon, comunidad);
  }
}
