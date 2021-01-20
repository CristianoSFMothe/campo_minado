// A classe dos campos do area onde irá controla ele
import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Campos {

  final int linha;
  final int coluna;
  final List<Campos> vizinhos = [];
  bool _aberto = false;

  // Se o campo estar marcado
  bool _marcado = false;

  // Se o campo estar minado
  bool _minado = false;

  // Campo explodido é o campo responsavel pelo o usuário perter o jogo
  bool _explodido = false;

  // Criando o construtor
  Campos({
    @required this.linha,
    @required this.coluna
  });

  // Função de adicionar vizinho
  void addVizinho(Campos vizinho) {

    final deltaLinha = (linha - vizinho.linha).abs();
    final deltacoluna = (coluna - vizinho.coluna).abs();

    // Verificando se o campo recebido é o proprio campo
    if (deltaLinha == 0 && deltacoluna == 0) {
      return;
    }
    
    // Verificando se são vizinhos
    if (deltaLinha <= 1 && deltacoluna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  // Metodo para uma bomba
  void abrir() {
    // Verificando se o campo estar aberto
    if (_aberto) {
      return;
    }

    _aberto = true;

    // Verificando se o campo estar minado
    if (_minado) {
      _minado = true;
      // Usando a exceção
      throw ExplosionException();
    }

    // Verificando se um campo não estar minado, usando a recursividade se o campo estiver seguro
    if (vizinhancaSegura) {
      vizinhos.forEach((v) => v.abrir());
    }
  }

  // Metodo para quando o jogador perder
  void revelarBombas() {
    if(_minado) {
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


  // Metodo para o campo minado
  bool get minado {
    return _minado;
  }


  // Metodo para explodir um campo
  bool get explodido {
    return _explodido;
  }

  // Metodo para abri o campo
  bool get aberto {
    return _aberto;
  }
  // Metodo para marcar um campo
  bool get marcado {
    return _marcado;
  }

  // Metodo para ver se o jogador resolveu o campo
  bool get resolvido{
    bool minadoEMaracado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEMaracado || seguroEAberto;
  }

  // Metodo para verificar se a vizinha estar segura
  bool get vizinhancaSegura {
    return vizinhos.every((v) => !v.minado);
  }

  // Calculando a quantidade de linhas
  int get qtdeMinasNaVizinhanca {
    return vizinhos.where((v) => v.minado).length;
  }
}