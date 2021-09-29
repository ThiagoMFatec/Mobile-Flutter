import 'package:flutter/material.dart';

class widgetHome extends StatefulWidget {
  const widgetHome({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<widgetHome> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  double IMC = 0 ;

  String infoResultado = "Classificação";

  void _add(){
    setState(() {
      double n1Peso = double.parse(n1Controller.text);
      double n2altura = double.parse(n2Controller.text);

      IMC = n1Peso / (n2altura * n2altura);

      if(IMC < 18.5)
      {
        infoResultado = 'Abaixo do peso Ideal.';
      }
      else if(IMC >= 18.5 && IMC <= 24.9)
      {
        infoResultado = 'Peso Ideal.';
      }
      else if(IMC > 24.9 && IMC <= 29.9)
      {
        infoResultado = 'Sobrepeso.';
      }
      else if(IMC > 29.9 && IMC <= 34.9)
      {
        infoResultado = 'Obesidade 1.';
      }
      else if(IMC > 34.9 && IMC <= 39.9)
      {
        infoResultado = 'Obesidade 2.';
      }
      else
      {
        infoResultado = 'Obesidade 3.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title(),
      backgroundColor: Colors.white,
      body:_body()
    );
  }

  _title() {
    return AppBar(
        title: Text(
          "Exercicio IMC",
          style:TextStyle(
            color:Colors.black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white

    );
  }

  _body() {
    return
      SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            _image(),

            _field("Insira o seu peso em KG:", n1Controller),
            _field("Insira a sua altura em centimetros:", n2Controller),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                _btnEstimate()
              ],
            ),
            _text(infoResultado),
          ],
        ),
      );
  }

  _field(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelTitulo,
        labelStyle: TextStyle(
            color:Colors.black
        ),

      ),
      textAlign: TextAlign.center,
      style:TextStyle(
          color:Colors.black,
          fontSize: 25.0
      ),
      controller: objController,
    );
  }

  _btnEstimate() {
    return Padding(
          padding:EdgeInsets.only(top:20.0, bottom:20.0),
          child:Container(
            height: 60.0,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width:5.0,
                )
            ),
            child:RaisedButton(
              onPressed: _add,
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Verificar",
                      style:TextStyle(
                        color:Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              color:Colors.lightBlueAccent,
            ),

          )
    );
  }

  _text(textoParaExibir) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.all(30.0),
      child:Text(
        textoParaExibir,
        textAlign: TextAlign.center,
        style: TextStyle(
          color:Colors.redAccent,
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
          decoration: TextDecoration.underline
        ),
      ),
    );
  }

  _image() {
    return Center(
      child: Image.asset(
        "assets/images/imc.jpg",
        height: 150,
        width: 150,
      ),
    );
  }

}