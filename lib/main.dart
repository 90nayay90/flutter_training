import 'package:flutter/material.dart';
import 'package:retgoo_kick_off/pages/add_product_page.dart';
import 'package:retgoo_kick_off/pages/home_page.dart';
import 'package:retgoo_kick_off/pages/products_page.dart';
import 'package:retgoo_kick_off/pages/profile_page.dart';
import 'package:retgoo_kick_off/pages/settings_page.dart';
import 'package:retgoo_kick_off/pages_jadwal_sholat/jadwal_surabaya.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
          )),
      home: HomePage(),
      routes: {
        "/profile": (context) => ProfilePage(),
        "/settings": (context) => SettingsPage(),
        "/products": (context) => ProductsPage(),
        "/add-product": (context) => AddProductPage(),
        "/jadwal_sholat_surabaya": (context) => JadwalSholatSurabaya(),
      },
    );
  }
}
