import 'package:flutter/material.dart';
import 'package:social_midia/uteis/paleta_cores.dart';

class NavegacaoAbas extends StatelessWidget {

  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;
  final bool indicadorEmbaixo;

  const NavegacaoAbas({
    Key? key,
    required this.icones,
    required this.indiceAbaSelecionada,
    required this.onTap,
    this.indicadorEmbaixo = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: BoxDecoration(
        border: indicadorEmbaixo
            ? Border(
            bottom: BorderSide(
                color: PaletaCores.azulSocial,
                width: 3
            ),
        )
            : Border(
            top: BorderSide(
                color: PaletaCores.azulSocial,
                width: 3
            )
        )
      ),
      tabs: icones.asMap().map((indice, icone){
        return MapEntry(indice, Tab(
          icon: Icon(
            icone,
            color: indiceAbaSelecionada == indice
                ?  PaletaCores.azulSocial
                : Colors.black54,
            size: 30,
          ),
        ));
      }).values.toList(),
    );
  }
}
