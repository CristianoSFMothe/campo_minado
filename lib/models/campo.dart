// A classe dos campos do area onde irá controla ele
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:flutter/foundation.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    @required this.linha,
    @required this.coluna,
  });

  // Função de adicionar vizinho
  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    // Verificando se o campo recebido é o proprio campo
    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }

    // Verificando se são vizinhos
    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  // Metodo abrir
  void abrir() {
    if (_aberto) {
      return;
    }

    _aberto = true;

    // Verificando se o campo estar mina
    if (_minado) {
      _explodido = true;
      // Usando a exceção
      throw ExplosaoException();
    }

    // Verificando se um campo não estar minado, usando a recursividade se o campo estiver seguro
    if (vizinhancaSegura) {
      vizinhos.forEach((v) => v.abrir());
    }
  }

  // Metodo para quando o jogador perder
  void revelarBomba() {
    if (_minado) {
      _aberto = true;
    }
  }

  // Metodo para minar
  void minar() {
    _minado = true;
  }

  // Alternar marcação
  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  // Metodo para reiniciar
  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get resolvido {
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEMarcado || seguroEAberto;
  }

  
  bool get vizinhancaSegura {
    return vizinhos.every((v) => !v.minado);
  }

  int get qtdeMinasNaVizinhanca {
    return vizinhos.where((v) => v.minado).length;
  }  
}