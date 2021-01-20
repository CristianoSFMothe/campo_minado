// A classe dos campos do area onde irá controla ele
import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Field {

  // Linda do campo
  final int line;
  
  // Coluna do campo
  final int column;
  
  // Campos vizinhos
  final List<Field> neighbors = [];

  // Se o campo estar aberto
  bool _open = false;

  // Se o campo estar marcado
  bool _marked = false;

  // Se o campo estar minado
  bool _undermined = false;

  // Campo explodido é o campo responsavel pelo o usuário perter o jogo
  bool _exploded = false;

  // Criando o construtor
  Field({
    @required this.line,
    @required this.column
  });

  // Função de adicionar vizinho
  void addNeigbor(Field neigbor) {

    final deltaLine = (line - neigbor.line).abs();
    final deltaColumn = (column - neigbor.column).abs();

    // Verificando se o campo recebido é o proprio campo
    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }
    
    // Verificando se são vizinhos
    if (deltaLine <= 1 && deltaColumn <= 1) {
      neighbors.add(neigbor);
    }
  }
}