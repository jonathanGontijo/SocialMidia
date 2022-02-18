import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:social_midia/componentes/area_estoria.dart';
import 'package:social_midia/componentes/area_postagem.dart';
import 'package:social_midia/componentes/botao_circulo.dart';
import 'package:social_midia/componentes/cartao_postagem.dart';
import 'package:social_midia/componentes/lista_contatos.dart';
import 'package:social_midia/componentes/lista_opcoes.dart';
import 'package:social_midia/dados/dados.dart';
import 'package:social_midia/modelos/modelos.dart';
import 'package:social_midia/uteis/paleta_cores.dart';
import 'package:social_midia/uteis/responsivo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Responsivo(
            mobile: HomeMobile(scrollController: _scrollController,),
            // tablet: HomeTable(),
            desktop: HomeDesktop(scrollController: _scrollController,),
          )
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {

  final TrackingScrollController scrollController;

  const HomeMobile({
    Key? key,
    required this.scrollController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          //expandedHeight: 250,
          title: Text(
            "Social",
            style: TextStyle(
                color: PaletaCores.azulSocial,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2
            ),
          ),
          actions: [
            BotaoCirculo(
              icone: Icons.search,
              iconeTamanho: 30,
              onPressed: (){},
            ),
            BotaoCirculo(
              icone: LineIcons.facebookMessenger,
              iconeTamanho: 30,
              onPressed: (){},
            )
          ],
        ),
        SliverToBoxAdapter(
          child:AreaPostagem(
            usuario: usuarioAtual,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaEstoria(
              usuario: usuarioAtual,
              estorias: estorias,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, indice){
                  Postagem postagem = postagens[indice];
                  return CartaoPostagem(
                      postagem: postagem
                  );
                },
                childCount: postagens.length
            )
        )
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {

  final TrackingScrollController scrollController;

  const HomeDesktop({
    Key? key,
    required this.scrollController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ListaOpcoes(
                  usuario: usuarioAtual
              ),
            )
        ),
        Spacer(),
        Flexible(
          flex: 5,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                    child: AreaEstoria(
                      usuario: usuarioAtual,
                      estorias: estorias,
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                            (context, indice){
                          Postagem postagem = postagens[indice];
                          return CartaoPostagem(
                              postagem: postagem
                          );
                        },
                        childCount: postagens.length
                    )
                )
              ],
            )
        ),
        Spacer(),
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ListaContatos(
                usuarios: usuariosOnline
              ),
            )
        ),
      ],
    );
  }
}

// class HomeTable extends StatelessWidget {
//   const HomeTable({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           backgroundColor: Colors.white,
//           floating: true,
//           centerTitle: false,
//           //expandedHeight: 250,
//           title: Text(
//             "Social",
//             style: TextStyle(
//                 color: PaletaCores.azulSocial,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 28,
//                 letterSpacing: -1.2
//             ),
//           ),
//           actions: [
//             BotaoCirculo(
//               icone: Icons.search,
//               iconeTamanho: 30,
//               onPressed: (){},
//             ),
//             BotaoCirculo(
//               icone: LineIcons.facebookMessenger,
//               iconeTamanho: 30,
//               onPressed: (){},
//             )
//           ],
//         ),
//         SliverToBoxAdapter(
//           child:AreaPostagem(
//             usuario: usuarioAtual,
//           ),
//         ),
//         SliverPadding(
//           padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
//           sliver: SliverToBoxAdapter(
//             child: AreaEstoria(
//               usuario: usuarioAtual,
//               estorias: estorias,
//             ),
//           ),
//         ),
//         SliverList(
//             delegate: SliverChildBuilderDelegate(
//                     (context, indice){
//                   Postagem postagem = postagens[indice];
//                   return CartaoPostagem(
//                       postagem: postagem
//                   );
//                 },
//                 childCount: postagens.length
//             )
//         )
//       ],
//     );
//   }
// }



