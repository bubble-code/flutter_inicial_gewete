import 'package:flutter/cupertino.dart';
import 'package:flutter_inicial_gewete/model/GeweteObj.dart';
import 'package:flutter_inicial_gewete/net/flutterfire.dart';

import '../model/SalonesModel.dart';

class SalonProvider extends ChangeNotifier {
  List<Salon> salones = [];
  List<NameSalon> listResult = [];
  bool loading = false;
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
}
