import 'package:flutter/material.dart';
import 'package:flutter_inicial_gewete/config/Palette.dart';
import '../addLocationSalon.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primatyColor,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () {},
      ),
      title: const Text("Hola Alejandro"),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddLocationSalon()));
            },
            icon: const Icon(Icons.notifications_none)),
      ],
    );
  }
}
