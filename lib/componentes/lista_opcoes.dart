import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:social_midia/componentes/botao_imagem_perfil.dart';
import 'package:social_midia/modelos/modelos.dart';
import 'package:social_midia/uteis/paleta_cores.dart';

class ListaOpcoes extends StatelessWidget {

  final Usuario usuario;

  final List<List> _opcoes = const [
    [LineIcons.userFriends, PaletaCores.azulSocial, "Amigos"],
    [LineIcons.facebookMessenger, PaletaCores.azulSocial, "Mensagens"],
    [LineIcons.flag, Colors.orange, "Páginas"],
    [LineIcons.users, PaletaCores.azulSocial, "Grupos"],
    [Icons.storefront_outlined, PaletaCores.azulSocial, "Marketplace"],
    [Icons.ondemand_video, Colors.red, "Assistir"],
    [LineIcons.calendar, Colors.deepPurple, "Eventos"],
    [LineIcons.chevronCircleDown, Colors.black45, "Ver mais"],
  ];
  const ListaOpcoes({
    Key? key,
    required this.usuario
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: 1 +  _opcoes.length,
          itemBuilder: (context, indice){
            
            if (indice ==0) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: BotaoImagemPerfil(
                  usuario: usuario,
                  onTap: (){},
                ),
              );
            }  

            List item = _opcoes[ indice -1];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Opcao(
                icone: item[0],
                cor: item[1],
                texto: item[2],
                onTap: (){},
              ),
            );
          }
      ),
    );
  }
}

class Opcao extends StatelessWidget {

  final IconData icone;
  final Color cor;
  final String texto;
  final VoidCallback onTap;
  const Opcao({
    Key? key,
    required this.icone,
    required this.cor,
    required this.texto,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, color: cor, size: 35,),
          SizedBox(width: 4,),
          Flexible(
              child: Text(texto,
                style: TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              )
          )
        ],
      ),
    );
  }
}

