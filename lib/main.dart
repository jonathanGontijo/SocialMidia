import 'package:flutter/material.dart';
import 'package:social_midia/telas/home.dart';
import 'package:social_midia/telas/principal.dart';
import 'package:social_midia/uteis/paleta_cores.dart';

void main() {
  runApp(MaterialApp(
    title: "Social",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: PaletaCores.scaffold
    ),
    home: Principal(),
  ));
}