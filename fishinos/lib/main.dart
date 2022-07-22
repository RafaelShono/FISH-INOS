import 'package:fishinos/dao/produtor_dao.dart';
import 'package:fishinos/modelo/produtor.dart';

import 'visao/produtor/tela_cadastro_produtor.dart';
import 'package:fishinos/visao/produtor/tela_cadastro_produtor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var telaCadastroProdutor = TelaCadastroProdutor();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fishinos',
      theme: ThemeData.dark(),
      home: telaCadastroProdutor,
    );
  }
}
