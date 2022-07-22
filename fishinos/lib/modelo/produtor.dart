import 'dart:ffi';

import 'package:fishinos/modelo/endereco.dart';

//import 'package:fishinos/modelo/produtor_propriedade.dart';

//import 'endereco.dart';

//import 'grupo_produtor.dart';

class Produtor {
  int? id;
  String? nome;
  String? email;
  String? cpfCnpj;
  String? telefone;
  bool ativo = true;

  set endereco(Endereco endereco) {}

  //List<ProdutorPropriedade> produtosAVenda = List.empty(growable: true);

  bool operator ==(other) {
    return (other is Produtor && other.id == this.id);
  }

  @override
  int get hashCode => super.hashCode;
}
