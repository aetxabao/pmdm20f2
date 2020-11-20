import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parla/providers/municipios_provider.dart';
import 'package:parla/screens/chart_totales_screen.dart';
import 'package:parla/widgets/slider_widget.dart';

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
              RaisedButton(
                child: Text("Totales"),
                onPressed: () {
                  Get.to(ChartTotalesScreen());
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(width: 2, color: Colors.blue)),
              ),
              SizedBox(
                height: 30.0,
              ),
              SliderWidget(lista: municipiosProvider.listaPartidos()),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ));
  }
}
