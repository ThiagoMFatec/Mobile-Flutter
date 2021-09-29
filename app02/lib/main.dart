import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home:Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

  String infoResultado = "Digite os Valores";

  void _estimate(){
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n1Controller.text);

      double res = n1+n2;

      infoResultado = 'Total : $res';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Exercicio Soma"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Insira o 1o. Valor: ",
                labelStyle: TextStyle(
                    color:Colors.black
                ),

              ),
              textAlign: TextAlign.center,
              style:TextStyle(
                  color:Colors.black,
                  fontSize: 25.0
              ),
              controller: n1Controller,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Insira o 2o. Valor: ",
                labelStyle: TextStyle(
                    color:Colors.black
                ),

              ),
              textAlign: TextAlign.center,
              style:TextStyle(
                  color:Colors.black,
                  fontSize: 25.0
              ),
              controller: n2Controller,
            ),
            Padding(
                padding:EdgeInsets.only(top:20.0, bottom:20.0),
                child:Container(
                  height: 50.0,
                  child:RaisedButton(
                    onPressed: _estimate,
                    child:Text("Calcular",
                      style:TextStyle(
                          color:Colors.black,
                          fontSize: 20.0
                      ),
                    ),
                    color:Colors.blue,
                  ),
                )
            ),
            Text(
              infoResultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            )
          ],
        ),


      ),
    );
  }
}