import 'package:flutter/material.dart';
import 'constantes.dart';

//Clase que nos permite crear un widget (En este caso, un HijoWResuable)

class HijoWReusable extends StatelessWidget {
  //Atributos con modificador 'final' (Que signifca que no van a cambiar)
  final Icon miIcono;
  final double tamanoCaja;
  final String texto;

  HijoWReusable({this.miIcono, this.tamanoCaja, this.texto});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        miIcono,
        SizedBox(
          height: tamanoCaja,
        ),
        Text(texto, style: kEstiloTexto)
      ],
    );
  }
}
