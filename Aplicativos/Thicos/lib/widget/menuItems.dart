import 'package:flutter/material.dart';

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

class MenuItems {
  static const List<MenuItem> firstItems = [historico, perfil, controle];
  static const List<MenuItem> secondItems = [sair];

  static const historico = MenuItem(text: 'Histórico', icon: Icons.history);
  static const perfil = MenuItem(text: 'Perfil', icon: Icons.person);
  static const controle =
      MenuItem(text: 'Controle', icon: Icons.construction_outlined);
  static const sair = MenuItem(text: 'Sair', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: Colors.white,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.historico:
        //Do something
        break;
      case MenuItems.perfil:
        //Do something
        break;
      case MenuItems.controle:
        //Do something
        break;
      case MenuItems.sair:
        Navigator.pushReplacementNamed(
          context,
          '/home',
        );

        break;
    }
  }
}
