import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../components/campo_widget.dart';
import '../models/campo.dart';
import '../models/explosao_exception.dart';

class CampoMinadoApp extends StatelessWidget {
  // Metodo para reiniciar
  void _reiniciar() {
    print('reiniciar...');
  }

  // Metodo para abri
  void _abrir(Campo campo) {
    print('Abrir...');
  }

  // Metodo para alternar a marcação
  void _alternarMarcacao(Campo campo) {
    print('Alternar Marcação...');
  }

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1, coluna: 0);
    vizinho1.minar();
    Campo vizinho2 = Campo(linha: 1, coluna: 1);
    vizinho2.minar();

    Campo campo = Campo(linha: 0, coluna: 0);
    campo.addVizinho(vizinho1);
    campo.addVizinho(vizinho2);

    try {
      // campo.minar();
      campo.alternarMarcacao();
    } on ExplosaoException {}

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlternarMaracacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
