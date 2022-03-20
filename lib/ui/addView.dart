import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "bitcoin",
    "tether",
    "ethereum",
  ];
  String dropdownValue = "bitcoin";
  TextEditingController _amoutController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              onChanged: (value) {
                setState(() {
                  dropdownValue = value.toString();
                });
              },
              value: dropdownValue,
              items: coins.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.4,
              child: TextFormField(
                controller: _amoutController,
                decoration: InputDecoration(
                  labelText: "Coin Amount"
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white
              ),
              child: MaterialButton(
                onPressed: () async{

                  Navigator.of(context).pop();
                },
                child: const Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
