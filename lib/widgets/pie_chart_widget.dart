import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:parla/models/votos_partido_model.dart';

class PieChartWidget extends StatelessWidget {
  List<VotosPartido> data;
  List<charts.Series> seriesList;
  bool animate;

  PieChartWidget({this.data, this.animate});

  @override
  Widget build(BuildContext context) {
    seriesList = _createSampleData();
    return new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 100,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));
  }

  List<charts.Series<VotosPartido, String>> _createSampleData() {
    return [
      new charts.Series<VotosPartido, String>(
        id: 'Partidos',
        domainFn: (VotosPartido vp, _) => vp.partido,
        measureFn: (VotosPartido vp, _) => vp.votos,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (VotosPartido vp, _) => vp.partido,
      )
    ];
  }
}
