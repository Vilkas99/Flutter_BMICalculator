import 'package:flutter/material.dart';
import 'constantes.dart';
import 'contenedor_reusable.dart';

class ResultadosPage extends StatelessWidget {
  ResultadosPage({this.textoResultado, this.resultado, this.descripcion});
  String textoResultado;
  String resultado;
  String descripcion;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: Text(
              "TUS RESULTADOS",
              style: kEstiloTextoResultados,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    textoResultado,
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                  //Columna que almacenará al valor de la altura y su unidad física.
                  Text(resultado,
                      style: TextStyle(
                          fontSize: 90.0, fontWeight: FontWeight.w900)),
                  Text(
                    descripcion,
                    style: kEstiloTexto,
                  ),
                  SizedBox(),

                  //Slider que nos permitirá modificar la altura
                ],
              ),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0))),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Color(0xFFEB1555),
              height: 65,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                  child: Text(
                "VOLVER A CALCULAR",
                style: kEstiloTextoBold,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
