import 'campo.dart';
import 'package:flutter/foundation.dart';

class Tabuleiro {

  final int linhas;
  final int colunas;
  final int qtdeBombas;

  final List<Campo> _campos = [];

  Tabuleiro({
    @required this.linhas,
    @required this.colunas,
    @required this.qtdeBombas,

  }) {
    _criarCampos();
  }

  void _criarCampos() {
    for(int l = 0; l < linhas; l++) {
      for(int c = 0; c < colunas; c++) {
        _campos.add(Campo(linha: l, coluna: c));
      }
    }
  }
}