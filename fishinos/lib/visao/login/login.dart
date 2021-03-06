import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fishinos/controle/controle_cadastros.dart';
import 'package:fishinos/controle/controle_sistema.dart';
import 'package:fishinos/dao/usuario_dao.dart';
import 'package:fishinos/modelo/usuario.dart';
import 'package:fishinos/modelo/utilitario.dart';
import 'package:fishinos/visao/widgets/mensagens.dart';
import 'package:fishinos/visao/widgets/textformfield.dart';
import 'package:fishinos/modelo/utilitario.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controladorCampoLogin =
      TextEditingController(text: "administrador");
  TextEditingController controladorCampoSenha =
      TextEditingController(text: "admin");
  String emailRecuperacao = "";
  late Future<Usuario> userValidate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color(0xFF61b255),
        backgroundColor: Color(0xFFE1E1E1),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Color(0xFF61b255),
                child: Image.asset('assets/imagens/logoOrganico.jpeg')),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width < 400
                        ? double.infinity
                        : 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          controller: controladorCampoLogin,
                          autofocus: true,
                          keyboardType: TextInputType.name,
                          style:
                              TextStyle(color: Color(0xFF1d1d1d), fontSize: 16),
                          decoration: decorationCampoTexto(
                            labelText: "LOGIN",
                            //labelStyle: TextStyle(color: Colors.white),
                          ),
                          cursorColor: Color(0xFF2e8228),
                        ),
                        Divider(),
                        TextField(
                          controller: controladorCampoSenha,
                          autofocus: true,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          style:
                              TextStyle(color: Color(0XFF1d1d1d), fontSize: 16),
                          decoration: decorationCampoTexto(
                            labelText: "SENHA",

                            //labelStyle: TextStyle(color: Colors.white),
                          ),
                          cursorColor: Color(0xFF2e8228),
                        ),
                        Divider(),
                        ButtonTheme(
                          height: 60.0,
                          child: InkWell(
                            onTap: () async {
                              Usuario? usuario = await ValidaLogin()
                                  .validacaoUser(controladorCampoLogin.text,
                                      controladorCampoSenha.text);
                              if (usuario != null) {
                                ControleSistema().usuarioLogado = usuario;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TelaPrincipal()));
                              } else {
                                mensagemAutenticacao(context,
                                    'USUARIO N??O ENCONTRADO', 'ATEN????O');
                              }
                            },
                            child: Container(
                                height: 50,
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  child: Center(
                                      child: Text(
                                    "ENTRAR",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                                  //color: Colors.red,
                                  color: Color(0xFF2e8228),
                                )),
                          ),
                        ),
                        ButtonTheme(
                          height: 60.0,
                          child: InkWell(
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext builder) {
                                    return AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        title: const Text('RECUPERAR A SENHA'),
                                        content: TextFormField(
                                          decoration: decorationCampoTexto(
                                              hintText:
                                                  "Digite o seu email aqui",
                                              labelText:
                                                  "Digite o seu email aqui"),
                                          onChanged: (value) {
                                            emailRecuperacao = value;
                                          },
                                          keyboardType: TextInputType.text,
                                        ),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () async {
                                                ControleCadastros<Usuario>
                                                    controle =
                                                    new ControleCadastros(
                                                        Usuario());
                                                List<Usuario> usuarios =
                                                    await controle
                                                        .atualizarPesquisa(
                                                            filtros: {
                                                      "email": emailRecuperacao
                                                    });
                                                if (usuarios.isNotEmpty) {
                                                  Usuario u = usuarios[0];
                                                  String corpo =
                                                      """ Segue abaixo o login e senha do usu??rio conforme socilitado
                                                  login ${u.login}
                                                  senha ${u.senha}
                                                      """;
                                                  enviarEmail(
                                                      destinatarios: [
                                                        emailRecuperacao
                                                      ],
                                                      assunto:
                                                          "Recupera????o de login/Senha app organicos",
                                                      emailRemetente:
                                                          "quitandaorganica@gmail.com",
                                                      nomeRemetente:
                                                          "Aplicativo Organicos",
                                                      texto: corpo);
                                                } else {
                                                  AlertDialog(
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      20.0))),
                                                      title: const Text(
                                                          'NENHUM EMAIL ENCONTRADO'));
                                                }
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("OK")),
                                          const SizedBox(
                                            width: 400,
                                            height: 20,
                                          )
                                        ]);
                                  });
                            },
                            child: Container(
                                height: 50,
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  child: Center(
                                      child: Text(
                                    "Esqueceu a senha?",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                                  //color: Colors.red,
                                  color: Color(0xFF2e8228),
                                )),
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        )));
  }
}
