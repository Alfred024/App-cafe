import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String link;
  final IconData icon;

  const MenuItem({required this.title, required this.link, required this.icon});
}

const profilePageMenuItems = <MenuItem>[
  MenuItem(
      title: 'Datos personales', link: '/personal_data', icon: Icons.person),
  MenuItem(
      title: 'Notificaciones',
      link: '/notifications',
      icon: Icons.notifications),
  MenuItem(
      title: 'Métodos de pago',
      link: '/payment-methods',
      icon: Icons.credit_card),
  MenuItem(title: 'Ayuda', link: '/help', icon: Icons.help),
  MenuItem(title: 'Ajustes', link: '/settings', icon: Icons.settings),
];
