// A classe dos campos do area onde irá controla ele
import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Campo {
  
  final int linha;
  final int coluna;
  final List<Campo> viizinhos = [];

  // Se o campo estar aberto
  bool _aberto = false;

  // Se o campo estar marcado
  bool _marcado = false;

  // Se o campo estar minado
  bool _minado = false;

  // Campo explodido é o campo responsavel pelo o usuário perter o jogo
  bool _explodido = false;

  // Criando o construtor
  Campo({
    @required this.linha,
    @required this.coluna
  });

  // Função de adicionar vizinho
  void addLinha(Campo vizinho) {

    final deltaLinha = (linha - vizinho.linha);
  }
}