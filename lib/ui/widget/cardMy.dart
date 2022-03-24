import 'package:flutter/material.dart';

class CardInicial extends StatefulWidget {
  final String titulo, subtitulo;

  const CardInicial(
      {Key? key,
      required this.titulo,
      required this.subtitulo,
      Function? functionCard})
      : super(key: key);

  @override
  State<CardInicial> createState() => _CardInicialState();
}

class _CardInicialState extends State<CardInicial> {
  late Function functionCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Card Click");
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 7.0,
        width: MediaQuery.of(context).size.width / 2,
        child: Card(
          child: ListTile(
            title: Text(
              widget.titulo,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            subtitle: Text(widget.subtitulo),
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
      ),
    );
  }
}
