import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contenedor_reusable.dart';
import 'icon_content.dart';
import 'constantes.dart';
import 'resultados_page.dart';
import 'calculadora.dart';

//CLASE: Se encarga de establecer las propiedades de los widgets de la app.

//Enum de géneros para los dos primeros botonoes.
enum Generos { hombre, mujer }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

//Estado de la clase.
class _InputPageState extends State<InputPage> {
  //Declaro los colores de ambos géneros (Y los inicializo en color suelto)
  Color cHombre = kColorSuelto;
  Color cMujer = kColorSuelto;

  int valorAltura = 180;
  int peso = 70;
  int edad = 18;

  //Establezco una variable de tipo 'Genero' que almacenará el género que haya seleccionado el usuario.
  Generos generoSeleccionado;

  //Creación del widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRUEBAS'),
      ),
      body: Column(
        children: <Widget>[
          //RECUADROS DEL APARTADO SUPERIOR
          Row(
            children: <Widget>[
              //Evento que identifica cuando un 'gesture' se presenta en alguno de los botones.
              WReusable(
                  //Establecemos su propiedad de 'alClick' (la cual toma una función)
                  alClick: () {
                    //Generamos un estado, debido a que hay un cambio en el valor de una variable (setState)
                    setState(() {
                      //Establecemos que el genero seleccionado será el de hombre
                      generoSeleccionado = Generos.hombre;
                    });
                  },
                  //Establecemos un terneario para su color:
                  //Si el genero selecciona es hombre, entonces tendrá el colorPresionado, de lo contrario, tendrá el colorSuelto
                  miColor: generoSeleccionado == Generos.hombre
                      ? kColorPresionado
                      : kColorSuelto,
                  hijo: HijoWReusable(
                    miIcono: Icon(
                      FontAwesomeIcons.mars,
                      size: 80.0,
                    ),
                    tamanoCaja: 15,
                    texto: "Hombre",
                  )),

              //Caso análogo con el otro género.
              WReusable(
                alClick: () {
                  setState(() {
                    generoSeleccionado = Generos.mujer;
                  });
                },
                miColor: generoSeleccionado == Generos.mujer
                    ? kColorPresionado
                    : kColorSuelto,
                hijo: HijoWReusable(
                  miIcono: Icon(
                    FontAwesomeIcons.venus,
                    size: 80,
                  ),
                  texto: "Mujer",
                  tamanoCaja: 15,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Wodget que posee la altura.
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Altura",
                        style: kEstiloTexto,
                      ),
                      //Columna que almacenará al valor de la altura y su unidad física.
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(valorAltura.toString(),
                              style: kEstiloTextoGrande),
                          Text("cm")
                        ],
                      ),
                      //Slider que nos permitirá modificar la altura
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                          value: valorAltura.toDouble(),
                          min: 120,
                          max: 220,
                          //Cuando el slider es utilizado...
                          onChanged: (valorNuevo) {
                            setState(() {
                              //Cambiamos el valor de la altura al valor del slider.
                              valorAltura = valorNuevo.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(left: 18),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10.0))),
            ],
          ),
          //Columna que almacena los paneles del peso y la edad.
          Row(
            children: <Widget>[
              // PESO
              WReusable(
                miColor: Color(0xFF1D1E33),
                //Columna que almacena el texto, numero y botones para el peso.
                hijo: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Peso",
                      style: kEstiloTexto,
                    ),
                    Text(
                      peso.toString(),
                      style: kEstiloTextoGrande,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Widget PROPIO que crea un boton circular
                        BotonIconoCirculo(
                          icono: Icons.add,
                          //Al ser presionado...
                          alPresionar: () {
                            setState(() {
                              //Aumentamos el valor de peso...
                              peso++;
                            });
                          },
                        ),
                        //Caja que crea un espacio entre ambos botones.
                        SizedBox(),
                        //Caso análogo que el anterior botón (Pero este es 'minus')
                        BotonIconoCirculo(
                          icono: FontAwesomeIcons.minus,
                          alPresionar: () {
                            setState(() {
                              peso--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),

              //Panel de la EDAD
              WReusable(
                miColor: Color(0xFF1D1E33),
                hijo: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Edad",
                      style: kEstiloTexto,
                    ),
                    Text(
                      edad.toString(),
                      style: kEstiloTextoGrande,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BotonIconoCirculo(
                          icono: Icons.add,
                          alPresionar: () {
                            setState(() {
                              edad++;
                            });
                          },
                        ),
                        SizedBox(),
                        BotonIconoCirculo(
                          icono: FontAwesomeIcons.minus,
                          alPresionar: () {
                            setState(() {
                              edad--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          //Container que al ser clickeado (Gesture Detector) manda a los usuarios a otra ventana.
          GestureDetector(
            onTap: () {
              //Instanciamos el objeto 'calcu' que me permtira calcular el BMI del usuario.
              Calculadora calcu = Calculadora(peso: peso, alturaA: valorAltura);

              //Navigator nos permite redireccionar al usuario, dandole un contexto y una ventna.
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultadosPage(
                            resultado: calcu.calcularBMI(),
                            textoResultado: calcu.obtenerTitulo(),
                            descripcion: calcu.obtenerDesc(),
                          )));
            },
            child: Container(
              color: Color(0xFFEB1555),
              height: 65,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                  child: Text(
                "RESULTADOS",
                style: kEstiloTextoBold,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

//Widgety PROPIO que me permite crear botones circulares (Toma como argumentos un icono y una función)
class BotonIconoCirculo extends StatelessWidget {
  BotonIconoCirculo({@required this.icono, @required this.alPresionar});

  final IconData icono;
  final Function alPresionar;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icono),
      elevation: 0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 40, height: 40),
      onPressed: () {
        alPresionar();
      },
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
