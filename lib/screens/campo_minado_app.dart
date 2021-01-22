import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';

_reiniciar() {
  print('reiniciar...');
}

class CampoMinadoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar(),
        ),
        
        body: Container(
          child: Text('Tabuleiro'),
        ),
      ),
      
    );
  }
}