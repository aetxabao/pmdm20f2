import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parla/screens/partidos_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: PartidosScreen(),
    );
  }
}
