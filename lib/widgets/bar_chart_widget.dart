import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:parla/models/votos_partido_model.dart';

class BarChartWidget extends StatelessWidget {
  List<VotosPartido> data;
  bool animate;
  List<charts.Series> seriesList;

  BarChartWidget({this.data, this.animate});

  @override
  Widget build(BuildContext context) {
    seriesList = _createSampleData();
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  List<charts.Series<VotosPartido, String>> _createSampleData() {
    return [
      new charts.Series<VotosPartido, String>(
        id: 'Partidos',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (VotosPartido vp, _) => vp.partido,
        measureFn: (VotosPartido vp, _) => vp.votos,
        data: data,
      )
    ];
  }
}
