import 'municipio_model.dart';

class Municipios {
  List<Municipio> lista = new List();

  Municipios.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final pnt = Municipio.fromJson(item);
      lista.add(pnt);
    });
  }
}
