import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange
      ),
      home:telaInicial() ,
    );
  }

}

telaInicial(){
  return Scaffold(
    appBar: AppBar(
      title: Text("App01 - Hello World!"),
    ),
    body: Container(
      color: Colors.white,
      child: Center(
        child: Text("Hello World!",
            style: TextStyle(
              fontSize: 70,
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.solid,
            )),
      ),
    ),


    drawer: Container(
        color: Colors.green
    ),
    floatingActionButton: FloatingActionButton(onPressed: () {},

    ),
  );
}