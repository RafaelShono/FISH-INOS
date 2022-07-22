import 'package:fishinos/modelo/usuario.dart';

class ControleSistema {
  static final ControleSistema _singleton = ControleSistema._internal();

  factory ControleSistema() {
    return _singleton;
  }
  ControleSistema._internal();

  Usuario? usuarioLogado;
}
