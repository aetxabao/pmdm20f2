import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:parla/models/municipio_model.dart';
import 'package:parla/models/municipios_model.dart';
import 'package:parla/models/votos_partido_model.dart';

class MunicipiosProvider {
  List<Municipio> lstMunicipios = [];
  List<String> lstNombres = [];
  String partido;
  List<String> lstPartidos = [
    "NA+",
    "EH Bildu",
    "I-E (n)",
    "PSN-PSOE",
    "GBAI",
    "SAIN",
    "VOX",
    "EQUO",
    "RCN-NOK",
    "Ln",
    "PODEMOS",
  ];

  List<String> listaPartidos() {
    return lstPartidos;
  }

  Future<List<Municipio>> cargarMunicipios() async {
    final data = await rootBundle.loadString('assets/data/parla2019.json');
    final decodedData = json.decode(data);
    // final openData = decodedData['OpenData'];
    // final openDataRow = openData['OpenDataRow'];
    Municipios municipios = Municipios.fromJsonList(decodedData);
    lstMunicipios = municipios.lista;
    return lstMunicipios;
  }

  Future<List<String>> cargarNombresMunicipiosGanador(String partido) async {
    if (lstMunicipios.length == 0) {
      await cargarMunicipios();
    }
    lstNombres = [];
    lstMunicipios.forEach((mun) {
      if ((mun.municipio.length > 0) && (mun.ganaPartido(partido))) {
        lstNombres.add(mun.municipio);
      }
    });
    await new Future.delayed(const Duration(seconds: 1));
    return lstNombres;
  }

  Future<List<VotosPartido>> cargarListaVotosPartido(String nombre) async {
    var mun;
    List<VotosPartido> lvp = [];
    if (lstMunicipios.length == 0) {
      await cargarMunicipios();
    }
    for (int i = 0; i < lstMunicipios.length; i++) {
      mun = lstMunicipios[i];
      if (mun.municipio == nombre) {
        lvp = mun.listaVotosPartido();
        break;
      }
    }
    await new Future.delayed(const Duration(seconds: 1));
    return lvp;
  }

  Future<List<VotosPartido>> cargarListaTotales() async {
    List<VotosPartido> lvp = [];
    if (lstMunicipios.length == 0) {
      await cargarMunicipios();
    }
    lvp = lstMunicipios[lstMunicipios.length - 1].listaVotosPartido();
    await new Future.delayed(const Duration(seconds: 1));
    return lvp;
  }
}

final municipiosProvider = new MunicipiosProvider();
