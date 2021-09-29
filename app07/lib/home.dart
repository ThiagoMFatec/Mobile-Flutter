import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class widgetHome extends StatefulWidget {
  const widgetHome({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<widgetHome> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  String n3Sexo = 'Feminino';
  String n4Escolaridade = 'Médio';
  double n5Limite = 1000;
  bool n6Brasileiro = true;

  String infoResultado = "Dados: ";
  String f1Nome = "";
  String f2Idade = "";
  String f3Sexo = "";
  String f4Escolaridade = "";
  String f5Limite = "";
  String f6Brasileiro = "";

  void _showForm(){
    setState(() {
      var n1Nome = (n1Controller.text);
      var n2Idade = (n2Controller.text);

      f1Nome = '  $n1Nome \n';
      f2Idade = ' $n2Idade \n';
      f3Sexo =  ' $n3Sexo \n';
      f4Escolaridade = ' $n4Escolaridade \n';
      f5Limite = ' $n5Limite \n';

      if(n6Brasileiro == true)
      {
        f6Brasileiro = 'Sim';
      }
      else
      {
        f6Brasileiro = 'Nã0';
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
          "Abrir conta",
          style:TextStyle(
            color:Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white
    );
  }

  _body() {
    return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children:<Widget>[
            _fieldNome("Nome: ", n1Controller),
            _fieldNome("Idade: ", n2Controller),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Sexo: ",
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                _fieldSexo(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Escolaridade: ",
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                _fieldEscolaridade(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Limite: ",
                  style:TextStyle(
                    color:Colors.black
                  ),
                ),
                _fieldLimit(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Brasileiro: ",
                  style:TextStyle(
                    color:Colors.black
                  ),
                ),
                _fieldBrasileiro(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                _btnRegister()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                _textTitle(infoResultado),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Nome: ",
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                _text(f1Nome),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Idade: ",
                  style:TextStyle(
                    color:Colors.black
                  ),
                ),
                _text(f2Idade),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Seco: ",
                  style:TextStyle(
                    color:Colors.black
                  ),
                ),
                _text(f3Sexo),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Escolaridade: ",
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                _text(f4Escolaridade),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Limite: ",
                  style:TextStyle(
                    color:Colors.black,
                  ),
                ),
                _text(f5Limite),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text(
                  "Brasileiro: ",
                  style:TextStyle(
                    color:Colors.black
                  ),
                ),
                _text(f6Brasileiro),
              ],
            ),
          ],
        ),
    );
  }

  _fieldNome(labelTitulo, objController) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelTitulo,
        labelStyle: TextStyle(
            color:Colors.black
        ),
      ),
      textAlign: TextAlign.center,
      style:TextStyle(
        color:Colors.black
      ),
      controller: objController
    );
  }

  _fieldSexo() {
    return DropdownButton<String>(
      value: n3Sexo,
      items: <String>['Masculino', 'Feminino']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          n3Sexo = valorSelecionado!;
        });
      },
    );

  }

  _fieldEscolaridade() {
    return DropdownButton<String>(
      value: n4Escolaridade,
      items: <String>['Fundamental',
        'Médio',
        'Superior',
        'Pós-Graduação',
        'Mestrado',
        'Doutorado']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          n4Escolaridade = valorSelecionado!;
        });
      },
    );

  }

  _fieldLimit() {
    return Slider(
      value: n5Limite,
      min: 1000,
      max: 10000,
      divisions: 20,
      label: n5Limite.round().toString(),
      onChanged: (double value) {
        setState(() {
          n5Limite = value;
        });
      },
    );
  }

  _fieldBrasileiro() {
    return Switch(
      value: n6Brasileiro,
      onChanged: (value) {
        setState(() {
          n6Brasileiro = value;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.blue
    );
  }

  _btnRegister() {
    return Padding(
            padding:EdgeInsets.only(top:20.0, bottom:20.0),
            child:Container(
              height: 40.0,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width:5.0
                  )
              ),
              child:RaisedButton(
                onPressed: _showForm,
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cadastrar",
                        style:TextStyle(
                          color:Colors.black,
                          fontSize: 12.0,
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
      height: 15.0,
      margin: const EdgeInsets.all(5.0),
      child:Text(
        textoParaExibir,
        textAlign: TextAlign.start,
        style: TextStyle(
          color:Colors.black,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline
        ),
      ),
    );
  }

  _textTitle(textoParaExibir) {
    return Container(
      height: 15.0,
      margin: const EdgeInsets.all(5.0),
      child:Text(
        textoParaExibir,
        textAlign: TextAlign.start,
        style: TextStyle(
          color:Colors.blueAccent,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}