import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inicial_gewete/model/Averias/AveriasModel.dart';

import '../model/GeweteObj.dart';
import '../model/SalonesModel.dart';

Future<bool> singIn(String email, String pass) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
    print('login ok');
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> register(String email, String pass) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak');
    } else if (e.code == 'email-already-in-use') {
      if (kDebugMode) {
        print('The account already exists for that email');
      }
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> addCoins(String id, String amount) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var value = double.parse(amount);
    DocumentReference documentrefe = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection('Coins')
        .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentrefe);
      if (!snapshot.exists) {
        documentrefe.set({'Amount': value});
        return true;
      }
      String newAmount = snapshot.get('Amount').toString();
      transaction
          .update(documentrefe, {'Amount': double.parse(newAmount) + value});
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<List<Salon>> listSalones(String comunidad) async {
  List<Salon> lista = [];
  await FirebaseFirestore.instance
      .collection("salones")
      .doc(comunidad)
      .collection("Salones")
      .get()
      .then(
        (value) => value.docs.forEach(
          (element) {
            lista.add(
              Salon(
                ip: element.get("ip"),
                nombre: element.id,
                pass: element.get("pass"),
              ),
            );
          },
        ),
      );
  return lista;
}

Future<int> listAverias(String name) async {
  int averias = 0;
  averias = await FirebaseFirestore.instance
      .collection("salones")
      .doc("Madrid")
      .collection("Salones")
      .doc(name)
      .collection("Averias")
      .get()
      .then((value) => value.docs.length);

  return averias;
}

Future<int> totalAverias(List<NameSalon> lista) async {
  int total = 0;
  await Future.wait([
    (() async => {
          for (var item in lista)
            {total = total + await listAverias(item.salon)}
        })()
  ]);
  return total;
}

Future<List<AveriasObject>> averiasDelSalon(
    String salon, String comunidad) async {
  List<AveriasObject> result = [];
  await FirebaseFirestore.instance
      .collection("salones")
      .doc(comunidad)
      .collection("Salones")
      .doc(salon)
      .collection("Averias")
      .get()
      .then(
        (value) => value.docs.forEach(
          (element) {
            result.add(
              AveriasObject(
                id: element.get("id"),
                date: element.get("date"),
                state: element.get("state"),
                subject: element.get("subject"),
              ),
            );
          },
        ),
      );
  return result;
}
