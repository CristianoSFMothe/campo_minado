import 'package:campo_minado/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Campo', () {
    test('Abri Campo COM Explosão', () {
      Campos c = Campos(linha: 0, coluna: 0);
      c.minar();

      expect(c.abrir, throwsException);
    });

    test('Abri Campo SEM Explosão', () {});

    test('Adicionar NÃO vizinho', () {});

    test('Adicionar  vizinho', () {});
  });
}
