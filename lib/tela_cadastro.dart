import 'package:app_completo/componentes/campo_input.dart';
import 'package:app_completo/valores.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  String nome = "";
  String sobrenome = "";
  String senha = "";
  String email = "";
  String telefone = "";
  DateTime? dataNascimento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Valores.corFundo,
        ),
        //Ajuste da tela quando o teclado subir para digitar
        resizeToAvoidBottomInset: true,
        backgroundColor: Valores.corFundo,
        body: SingleChildScrollView(
            //Barra de rolagem não tem margem interna
            padding: EdgeInsets.zero,
            //Dentro da barra de rolagem tem um Container para agrupar os demais componentes
            child: Container(
              //Altura do Container (tamanho da tela do disposito - 100 do AppBar)
              height: MediaQuery.of(context).size.height - 100,
              //Margem externa do Container - esquerda, acima, direita e abaixo
              margin: const EdgeInsets.fromLTRB(0, 20, 30, 0),
              //Margem interna do Container - esquerda, acima, direita e abaixo
              padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 0.0),
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
                      Color.fromARGB(255, 68, 24, 84),
                      Color.fromARGB(255, 24, 57, 84),
                    ]),
                //Borda com cantos arredondados
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  //Primeiro componente é um Padding só para dar espaçamento entre os componentes
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60)),
                  //Segundo componente é o texto de título da tela
                  const Text(
                    "Tela de cadastro",
                    //Personalização do texto (cor, tamanho e estilo)
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  //Terceiro componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  //Quarto componente é um campo de usando a classe CampoInput
                  CampoInput(
                    aoDigitar: (valor) => {
                      setState(() {
                        nome = valor;
                      })
                    },
                    textoHint: "Digite o seu nome",
                    textoLabel: "Nome",
                    iconeInput: const Icon(Icons.text_format_sharp),
                    campoSenha: false,
                  ),

                  //Quinto componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  //Sexto componente usando a classe CampoInput
                  CampoInput(
                    aoDigitar: (valor) => {
                      setState(() {
                        sobrenome = valor;
                      })
                    },
                    textoHint: "Digite o sobrenome",
                    textoLabel: "Sobrenome",
                    iconeInput: const Icon(Icons.text_format_sharp),
                    campoSenha: false,
                  ),
                  //Sétimo componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  //Oitavo componente usando a classe CampoInput
                  CampoInput(
                    aoDigitar: (valor) => {
                      setState(() {
                        email = valor;
                      })
                    },
                    textoHint: "Digite o e-mail",
                    textoLabel: "E-mail",
                    iconeInput: const Icon(Icons.email),
                    campoSenha: false,
                  ),
                  //Nono componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  //Décimo componente usando a classe CampoInput
                  CampoInput(
                    aoDigitar: (valor) => {
                      setState(() {
                        senha = valor;
                      })
                    },
                    textoHint: "Digite a senha",
                    textoLabel: "Senha",
                    iconeInput: const Icon(Icons.password),
                    campoSenha: true,
                  ),
                  //Décimo primeiro componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  //Décimo segundo componente usando a classe CampoInput
                  CampoInput(
                    aoDigitar: (valor) => {
                      setState(() {
                        telefone = valor;
                      })
                    },
                    textoHint: "Digite o telefone",
                    textoLabel: "Telefone",
                    iconeInput: const Icon(Icons.phone),
                    campoSenha: false,
                  ),
                  //Décimo terceiro componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
                  //Décimo quarto componente é um botão dentro de uma linha com
                  //o componente Expanded para ocupar toda a lateral da tela
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => {},
                              child: const Text(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  "Cadastrar")))
                    ],
                  ),
                  //Décimo quinto, outro botão dentro da Row e do Expanded
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
                ],
              ),
            )));
  }
}
