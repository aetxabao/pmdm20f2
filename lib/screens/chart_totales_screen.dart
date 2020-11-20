import 'package:flutter/material.dart';
import 'package:parla/providers/municipios_provider.dart';
import 'package:parla/widgets/pie_chart_widget.dart';

class ChartTotalesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Totales"),
      ),
      body: _chart(),
    );
  }

  Widget _chart() {
    return FutureBuilder(
      future: municipiosProvider.cargarListaTotales(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return PieChartWidget(data: snapshot.data, animate: false);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
