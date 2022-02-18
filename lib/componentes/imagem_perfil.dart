import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_midia/uteis/paleta_cores.dart';

class ImagemPerfil extends StatelessWidget {

  final String urlImagem;
  final bool foiVisualizado;

  const ImagemPerfil({
    Key? key,
    required this.urlImagem,
    this.foiVisualizado = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: PaletaCores.azulSocial,
      child: CircleAvatar(
        radius: foiVisualizado ? 20 : 17,
        backgroundImage: CachedNetworkImageProvider(urlImagem),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
