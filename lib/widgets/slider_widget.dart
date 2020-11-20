import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:parla/screens/municipios_screen.dart';

class SliderWidget extends StatelessWidget {
  final box = GetStorage();

  final List<String> lista;

  SliderWidget({@required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _slider(context),
    );
  }

  Widget _slider(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.5,
      child: PageView(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.7),
        children: _elementos(context),
      ),
    );
  }

  List<Widget> _elementos(BuildContext context) {
    final List<Widget> lst = [];
    lista.forEach((p) {
      final c = GestureDetector(
        onTap: () {
          box.write('partido', p);
          Get.to(MunicipiosScreen());
        },
        child: Container(
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                side: BorderSide(width: 2, color: Colors.blue)),
            child: Center(
              child: Text(
                p,
                style: TextStyle(fontSize: 75.0),
              ),
            ),
          ),
        ),
      );
      lst.add(c);
    });
    return lst;
  }
}
