import 'package:flutter/material.dart';

class PartidosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Parlamento 2019"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Esto debería ser un RaisedButton"),
              SizedBox(
                height: 30.0,
              ),
              Text("Esto debería ser un SliderWidget"),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ));
  }
}
