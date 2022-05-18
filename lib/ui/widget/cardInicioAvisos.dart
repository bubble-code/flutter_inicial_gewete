import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/model/AvisosModel.dart';
import 'package:flutter_inicial_gewete/ui/widget/cardAvisosInicio.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInicioAvisos extends StatelessWidget {
  CardInicioAvisos({
    Key? key,
  }) : super(key: key);
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db.collection("Checklist").snapshots(),
      builder: ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        List<Widget> listOfWidgetAvisos = [];
        if (!snapshot.hasData) return Container();
        List<DocumentSnapshot> listOfDocumentSnapshot = snapshot.data!.docs;
        for (var e in listOfDocumentSnapshot) {
          listOfWidgetAvisos.add(
            CardAvisos(
              titulo: e.get("fecha").toString(),
              detalles: e.get("detalles"),
              fecha: "",
            ),
          );
        }
        return Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [...listOfWidgetAvisos],
          ),
        );
      }),
    );
  }
}
  

// ListView(
//           
//                   //Text de la card
//                   Container(
//                     width: MediaQuery.of(context).size.width * 1 / 2,
//                     margin: const EdgeInsets.only(left: 30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           snapshot.data!.id.toString(),
//                           style: GoogleFonts.rajdhani(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.red[200],
//                           ),
//                           textAlign: TextAlign.start,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Wrap(
//                           alignment: WrapAlignment.center,
//                           spacing: 10,
//                           runSpacing: 20,
//                           children: [
//                             Text(
//                               "mañana recoger las contadoras a las 12:00 en Mecaban",
//                               style: GoogleFonts.rajdhani(
//                                 fontSize: 12,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   //Arrow de detalles de la card
//                   Container(
//                     margin: const EdgeInsets.only(top: 30, left: 20),
//                     child: InkWell(
//                       onTap: () {},
//                       child: const Icon(
//                         Icons.arrow_right,
//                         size: 35,
//                         color: Colors.amber,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),