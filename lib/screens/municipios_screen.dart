import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:parla/providers/municipios_provider.dart';

import 'chart_municipio_screen.dart';

class MunicipiosScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  String partido;

  @override
  Widget build(BuildContext context) {
    partido = box.read('partido');
    return Scaffold(
      appBar: AppBar(
        title: Text('Dónde gana ' + partido),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: municipiosProvider.cargarNombresMunicipiosGanador(partido),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(BuildContext context, List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          args['municipio'] = element;
          Get.to(ChartMunicipioScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
