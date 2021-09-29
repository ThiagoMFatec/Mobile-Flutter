import 'package:flutter/material.dart';
import 'dart:math';

class widgetHome extends StatefulWidget {
  const widgetHome({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<widgetHome> {
  int numeroSorteado = 0 ;
  String infoResultado = "";

  void _sort(){
    setState(() {
      numeroSorteado = new Random().nextInt(11);
      infoResultado = 'Numero: $numeroSorteado ';
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
          "Exercicio Valor Aleatório",
          style:TextStyle(
            color:Colors.black,
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
            _text("Imagine um valor entre 0 e 10!"),
            _text(infoResultado),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                _btnEstimate(),
              ],
            ),
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
              onPressed: _sort,
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sorteio",
                      style:TextStyle(
                        color:Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
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
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}