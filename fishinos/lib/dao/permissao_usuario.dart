import 'package:fishinos/dao/dao.dart';
import 'package:fishinos/modelo/permissoes.dart';
import 'package:fishinos/dao/conexao.dart';

class PermissaoUsuarioDAO extends DAO<PermissaoUsuario> {
  @override
  Future<PermissaoUsuario> carregarDados(PermissaoUsuario object,
      {Map<String, dynamic>? filtros}) {
    // TODO: implement carregarDados
    throw UnimplementedError();
  }

  @override
  Future<void> excluir(PermissaoUsuario permissaoUsuario) async {
    // TODO: implement excluir
    var conexao = await Conexao.getConexao();
    await conexao.transaction((transacao) async {
      var resultadoInsert = await transacao.prepared(
          '''delete from permissao_usuario where permissao_id = ? and usuario_id = ?''',
          [
            permissaoUsuario.permissao?.id,
            permissaoUsuario.usuario?.id,
          ]);
    });
  }

  @override
  Future<void> gravar(PermissaoUsuario permissaoUsuario) async {
    // TODO: implement gravar
    var conexao = await Conexao.getConexao();
    await conexao.transaction((transacao) async {
      var resultadoInsert = await transacao.prepared(
          '''replace into permissao_usuario (permissao_id,usuario_id, permitido) values (?, ?, ?)''',
          [
            permissaoUsuario.permissao?.id,
            permissaoUsuario.usuario?.id,
            permissaoUsuario.permitido
          ]);
    });
  }

  @override
  Future<List<PermissaoUsuario>> listar({Map<String, dynamic>? filtros}) {
    // TODO: implement listar
    throw UnimplementedError();
  }

  @override
  Future<List<PermissaoUsuario>> pesquisar({Map<String, dynamic>? filtros}) {
    // TODO: implement pesquisar
    throw UnimplementedError();
  }
}
