import 'package:flutter/material.dart';
import 'package:parla/providers/municipios_provider.dart';
import 'package:parla/widgets/bar_chart_widget.dart';

class ChartMunicipioScreen extends StatelessWidget {
  String municipio;

  @override
  Widget build(BuildContext context) {
    municipio = "ZZZZZ";
    return Scaffold(
      appBar: AppBar(
        title: Text(municipio),
      ),
      body: _chart(),
    );
  }

  Widget _chart() {
    return FutureBuilder(
      future: municipiosProvider.cargarListaVotosPartido(municipio),
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
