import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parla/providers/municipios_provider.dart';
import 'package:parla/screens/partidos_screen.dart';
import 'package:parla/widgets/bar_chart_widget.dart';

class ChartMunicipioScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args['municipio']),
        actions: [
          IconButton(
            icon: Icon(Icons.account_balance),
            onPressed: () {
              Get.offAll(PartidosScreen());
            },
          )
        ],
      ),
      body: _chart(),
    );
  }

  Widget _chart() {
    return FutureBuilder(
      future: municipiosProvider.cargarListaVotosPartido(args['municipio']),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BarChartWidget(data: snapshot.data, animate: false);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
