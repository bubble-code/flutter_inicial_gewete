import 'package:address_search_field/address_search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddLocationSalon extends StatefulWidget {
  const AddLocationSalon({Key? key}) : super(key: key);

  @override
  State<AddLocationSalon> createState() => _AddLocationSalonState();
}

class _AddLocationSalonState extends State<AddLocationSalon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuracion de Salones"),
        // centerTitle: true,
        // automaticallyImplyLeading: false,
        // actions: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.filter)),
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        // ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              CupertinoFormSection(
                  header: const Text("Detalles de Salones"),
                  children: [
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                          placeholder: "Nombre del Salon"),
                      // prefix: const Text("Nombre del Local"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    CupertinoFormRow(
                      child:
                          CupertinoTextFormFieldRow(placeholder: "Ubicacion"),
                      // prefix: const Text("Nombre del Local"),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
