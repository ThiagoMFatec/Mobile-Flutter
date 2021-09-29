import 'package:flutter/material.dart';

class widgetHome extends StatefulWidget {
  const widgetHome({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<widgetHome> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

  String infoResultado = "Digite os Valores";

  void _estimate(){
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);

      double resultado = n1*n2;

      infoResultado = 'TOTAL : $resultado';

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
        "Exercicio Multiplica",
        style:TextStyle(
          color:Colors.orange,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white
    );
  }

  _body() {
    return
      SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget>[
            _field("Insira o 1o. Valor:", n1Controller),
            _field("Insira o 2o. Valor:", n2Controller),
            _button(),
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
          fontSize: 35
      ),
      controller: objController,
    );
  }

  _button() {
    return
      Padding(
          padding:EdgeInsets.only(top:20.0, bottom:20.0),
          child:Container(
            height: 50.0,
            child:RaisedButton(
              onPressed: _estimate,
              child:Text("Calcular",
                style:TextStyle(
                  color:Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color:Colors.blue,
            ),
          )
      );
  }

  _text(showText) {
    return Text(
      showText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color:Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    );
  }

  _image() {
    return Center(
      child: Image.network(
        'https://a-static.mlcdn.com.br/618x463/trem-trenzinho-eletrico-ferrovia-amarelo-colecao-construtores-artebrincs/artebrincs/12809128822/0ff963cbeb64c62dcc1fa1c985bc6362.jpg',
        height: 150,
        width: 150,
      ),
    );
  }
}