import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:social_midia/componentes/navegacao_abas.dart';
import 'package:social_midia/componentes/navegacao_abas_desktop.dart';
import 'package:social_midia/dados/dados.dart';
import 'package:social_midia/telas/home.dart';
import 'package:social_midia/uteis/responsivo.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  final List<Widget> _telas = [
    Home(),
    Scaffold(
      backgroundColor: Colors.green,
    ),
    Scaffold(
      backgroundColor: Colors.yellow,
    ),
    Scaffold(
      backgroundColor: Colors.purple,
    ),
    Scaffold(
      backgroundColor: Colors.orange,
    ),
    Scaffold(
      backgroundColor: Colors.black,
    ),

  ];

  List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {

    final bool isDesktop = Responsivo.isDesktop(context);
    final tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
        length: _icones.length,
        child: Scaffold(
          appBar: isDesktop
              ? PreferredSize(
              child: NavegacacaoAbasDesktop(
                usuario: usuarioAtual,
                icones: _icones,
                indiceAbaSelecionada: _indiceAbaSelecionada,
                onTap: (indice){
                  setState(() {
                    _indiceAbaSelecionada = indice;
                  });
                },
              ),
              preferredSize: Size(tamanho.width, 65)
          )
              : null,
          body: TabBarView(
            children: _telas,
          ),
          bottomNavigationBar: isDesktop ? null : NavegacaoAbas(
            icones: _icones,
            indiceAbaSelecionada: _indiceAbaSelecionada,
            onTap: (indice){
              setState(() {
                _indiceAbaSelecionada = indice;
              });
            },
          ),
        )
    );
  }
}

