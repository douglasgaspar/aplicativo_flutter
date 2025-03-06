import 'package:flutter/material.dart';

import 'componentes/campo_input.dart';
import 'models/usuario.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  String email = "";
  String senha = "";

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  void limparCampos() {
    controllerEmail.text = "";
    controllerSenha.text = "";
  }

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar;
    Usuario u;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 68, 24, 84),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 68, 24, 84),
        ),
        //Tela contém barra de rolagem para teclado não cobrir os componentes
        body: SingleChildScrollView(
            //Barra de rolagem não tem margem interna
            padding: EdgeInsets.zero,
            //Dentro da barra de rolagem tem um Container para agrupar os demais componentes
            child: Container(
                //Altura do Container (tamanho da tela do disposito - 100 do AppBar)
                height: MediaQuery.of(context).size.height - 100,
                //Margem externa do Container - esquerda, acima, direita e abaixo
                margin: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                //Margem interna do Container - esquerda, acima, direita e abaixo
                padding: const EdgeInsets.fromLTRB(25.0, 80.0, 25.0, 0.0),
                //Cor e efeitos (gradiente, sombra e raio da borda) do Container
                decoration: const BoxDecoration(
                  //Sombra
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 88, 88, 88),
                        spreadRadius: 8, //Quantidade de sobra para "fora"
                        blurRadius: 10) //Quantidade de esfumaçado da sombra
                  ],
                  //Cor de fundo usando gradiente (duas cores)
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 24, 57, 84),
                        Color.fromARGB(255, 68, 24, 84),
                      ]),
                  //Borda com cantos arredondados
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0)),
                ),
                //Os comandos acima foram só para personalizar (cor, tamanho, efeitos) o Container
                //Agora será configurado o conteúdo e componentes dentro do Container
                //A tela foi configurada como 1 coluna. A Coluna pode ter vários componentes (children)
                child: Column(children: [
                  //Primeiro componente é um Padding só para dar espaçamento entre os componentes
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60)),
                  //Segundo componente é o texto de título da tela
                  const Text(
                    "Atualizar senha",
                    //Personalização do texto (cor, tamanho e estilo)
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  //Segundo componente é um Padding só para dar espaçamento entre os componentes
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60)),
                  //Terceiro componente é um campo de usando a classe CampoInput
                  CampoInput(
                    aoDigitar: (valor) => {
                      setState(() {
                        email = valor;
                      })
                    },
                    textoHint: "Digite o seu e-mail",
                    textoLabel: "E-mail",
                    iconeInput: const Icon(Icons.email),
                    campoSenha: false,
                    controller: controllerEmail,
                  ),
                  //Quarto componente é um Padding só para dar espaçamento entre os componentes
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  //Quinto componente é um campo de usando a classe CampoInput
                  CampoInput(
                    aoDigitar: (valor) => {
                      setState(() {
                        senha = valor;
                      })
                    },
                    textoHint: "Digite a nova senha",
                    textoLabel: "Senha",
                    iconeInput: const Icon(Icons.password),
                    campoSenha: true,
                    controller: controllerSenha,
                  ),
                  //Sexto componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
                  //Sétimo componente é um botão dentro de uma linha com
                  //o componente Expanded para ocupar toda a lateral da tela
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () async => {
                                    if (email.isEmpty || senha.isEmpty)
                                      {
                                        snackBar = const SnackBar(
                                            content: Text(
                                                "Preencha todos os campos")),
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar),
                                      }
                                    else
                                      {
                                        u = Usuario.alterarSenha(email, senha),
                                        if (await u.atualizarSenha())
                                          {
                                            snackBar = const SnackBar(
                                                content:
                                                    Text("Senha atualizada")),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar),
                                            limparCampos()
                                          }
                                        else
                                          {
                                            snackBar = const SnackBar(
                                                content: Text(
                                                    "Erro ao atualizar. Confira o e-mail!")),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar),
                                          }
                                      }
                                  },
                              child: const Text(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  "Atualizar senha"))),
                    ],
                  ),
                  //Oitavo sétimo, outro botão dentro da Row e do Expanded
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => {Navigator.of(context).pop()},
                              child: const Text(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  "Voltar")))
                    ],
                  ),
                ]))));
  }
}
