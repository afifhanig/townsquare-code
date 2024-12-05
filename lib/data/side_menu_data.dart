import 'package:flutter/material.dart';
import 'package:townsquare_app/model/menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Activities', route: '/main-dashboard'),
    MenuModel(icon: Icons.map_outlined, title: 'Location', route: '/location-screen'),
    MenuModel(icon: Icons.star_border_outlined, title: 'Services', route: ''),
    MenuModel(icon: Icons.people_outline, title: 'Communities', route: ''),
    MenuModel(icon: Icons.notifications_none_outlined, title: 'Notifications', route: ''),
  ];
}
