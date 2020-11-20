import 'package:flutter/material.dart';

class MunicipiosScreen extends StatelessWidget {
  String partido;

  @override
  Widget build(BuildContext context) {
    partido = "XXXXX";
    return Scaffold(
      appBar: AppBar(
        title: Text('Dónde gana ' + partido),
      ),
      body: Text("Esto debería ser un ListView"),
    );
  }
}
