import 'package:flutter/material.dart';

class CardMain extends StatelessWidget {
  final String titulo, subtitulo;
  const CardMain({Key? key, required this.titulo, required this.subtitulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.0,
      width: 20.0,
      child: Card(
        child: ListTile(
          title: Text(
            titulo,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          subtitle: Text(subtitulo),
          trailing: const Icon(
            Icons.warning_amber,
            color: Colors.redAccent,
          ),
        ),
        elevation: 8,
        shadowColor: Colors.blue[50],
        margin: const EdgeInsets.only(
            left: 10.0, top: 5.0, right: 10.0, bottom: 3.0),
      ),
    );
  }
}
