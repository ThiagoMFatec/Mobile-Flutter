import 'package:flutter/material.dart';

class widgetHome extends StatefulWidget {
  const widgetHome({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<widgetHome> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  double vlCombustivel = 0 ;

  String infoResultado = "Resultado";

  void _add(){
    setState(() {
      double n1Etanol = double.parse(n1Controller.text);
      double n2Gasolina = double.parse(n2Controller.text);
      vlCombustivel = n1Etanol / n2Gasolina ;
      if(vlCombustivel < 0.71)
      {
        infoResultado = 'Vai de Etanol(Etanóis)';
      }
      else
      {
        infoResultado = 'Vai de Gasolina(Mijolina)';
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
    return
      AppBar(

        title: Text(
          "Etanol ou Gasolina",
          style:TextStyle(
            color:Colors.black,

          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,

      );
  }

  _body() {
    return
      SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children:<Widget>[
            _image(),
            _field("Insira o valor do Etanol", n1Controller),
            _field("Insira o valor da Gasolina", n2Controller),
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
    return
      Padding(
          padding:EdgeInsets.only(top:20.0, bottom:20.0),

          child:Container(
            height: 55.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black,
                  width:4.0,)
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

  _text(txtShow) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.all(30.0),
      child:Text(
        txtShow,
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

  _image() {
    return Center(
      child: Image.asset(
        "assets/images/alcoolougasolina.jpg"
      ),
    );
  }

  _textEdge() {
    return BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width:5.0
        ),
    );
  }
}