import '../models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMaracacao;

  CampoWidget({
    @required this.campo,
    @required this.onAbrir,
    @required this.onAlternarMaracacao,
  });

  // Metodo para controlar as imagens que aparecem
  Widget _getImage() {
    int qtdeMinas = campo.qtdeMinasNaVizinhanca;
    // Verificar se o campo está explodida
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdeMinas.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMaracacao(campo),
      child: _getImage(),
    );
  }
}
