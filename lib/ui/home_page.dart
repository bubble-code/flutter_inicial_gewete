import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/ui/addLocationSalon.dart';

import 'addView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tickes Pendientes"),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddLocationSalon()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: const [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {},
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection("ticket")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              widthFactor: 5,
              child: ListView(
                children: [
                  ...snapshot.data!.docs
                      .map(
                        (e) => Card(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: ListTile(
                              title: Text(e.id,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  )),
                              subtitle: Text("${e.get("detalle")}"),
                              trailing: e.get('priory') == 1
                                  ? const Icon(
                                      Icons.warning_amber,
                                      color: Colors.redAccent,
                                    )
                                  : const Icon(
                                      Icons.one_k_plus,
                                      color: Colors.transparent,
                                    ),
                            ),
                          ),
                          elevation: 8,
                          shadowColor: Colors.blue[50],
                          margin: const EdgeInsets.only(
                              left: 10.0, top: 5.0, right: 10.0, bottom: 3.0),
                        ),
                      )
                      .toList(),
                ],
              ),
            );
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddView(),
              ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}