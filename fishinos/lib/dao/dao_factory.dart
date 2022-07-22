import 'package:fishinos/dao/grupoprodutor_dao.dart';
import 'package:fishinos/dao/gruposuario_dao.dart';
import 'package:fishinos/dao/permissao_dao.dart';
import 'package:fishinos/dao/permissao_grupousuario.dart';
import 'package:fishinos/dao/permissao_usuario.dart';
import 'package:fishinos/dao/produtor_dao.dart';
import 'package:fishinos/dao/usuario_dao.dart';
import 'package:fishinos/modelo/grupo_produtor.dart';
import 'package:fishinos/modelo/permissoes.dart';
import 'package:fishinos/modelo/produtor.dart';
import 'package:fishinos/modelo/usuario.dart';
import 'dao.dart';

class DAOFactory<T> {
  DAO<T>? createDAO(T objectInstance) {
    if (objectInstance is Permissao) return PermissaoDAO() as DAO<T>;
    if (objectInstance is PermissaoUsuario)
      return PermissaoUsuarioDAO() as DAO<T>;
    if (objectInstance is PermissaoGrupo) return PermissaoGrupoDAO() as DAO<T>;
    if (objectInstance is GrupoProdutor) return GrupoProdutorDAO() as DAO<T>;
    if (objectInstance is Usuario) return UsuarioDAO() as DAO<T>;
    if (objectInstance is Produtor) return ProdutorDAO() as DAO<T>;

    return null;
  }
}
