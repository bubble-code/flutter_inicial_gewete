import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/ui/widget/buttonDashGrid.dart';

import 'cardMy.dart';

class GeweteGrid extends StatelessWidget {
  const GeweteGrid({Key? key}) : super(key: key);

  // const CustomScrollView(
  //         physics: ClampingScrollPhysics(),
  //         slivers: [
  //           SliverPadding(
  //             padding: EdgeInsets.all(5),
  //             sliver: SliverToBoxAdapter(
  //               child:

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser?.email)
            .collection("salones")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? Center(
                  widthFactor: 5,
                  child: ListView(children: [
                    ...snapshot.data!.docs.map((e) => CardInicial(
                          titulo: e.id.toUpperCase(),
                          subtitulo: "dd",
                          functionCard: () {},
                        ))
                  ]),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
