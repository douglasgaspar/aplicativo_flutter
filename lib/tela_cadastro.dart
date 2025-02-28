import 'package:app_completo/componentes/campo_input.dart';
import 'package:app_completo/models/usuario.dart';
import 'package:app_completo/valores.dart';
import 'package:flutter/material.dart';
//Pacote para formatação de datas
import 'package:intl/intl.dart';

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

  //Objeto para controlar o conteúdo do TextField
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerSobrenome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();
  TextEditingController controllerData = TextEditingController();

  //Método para fazer aparecer o calendário de selecionar data ao clican
  //sobre o ícone no lado direito do TextField de Data de Nascimento
  Future<void> abrirCalendario() async {
    DateTime? dataSelecionada = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    setState(() {
      dataNascimento = dataSelecionada;
      //Formata a data para exibir no TextField
      controllerData.text =
          DateFormat('dd/MM/yyyy').format(dataNascimento!).toString();
    });
  }

  void limparCampos() {
    controllerNome.text = "";
    controllerSobrenome.text = "";
    controllerEmail.text = "";
    controllerSenha.text = "";
    controllerTelefone.text = "";
    controllerData.text = "";
  }

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar;
    Usuario u;

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
                    controller: controllerNome,
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
                    controller: controllerSobrenome,
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
                    controller: controllerEmail,
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
                    controller: controllerSenha,
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
                    controller: controllerTelefone,
                  ),
                  //Décimo terceiro componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  //Décimo quarto componente é um input para selecionar a data de nascimento
                  //que possui um calendário associado ao botão no lado direito do campo
                  TextField(
                    //Controller é utilizado para atribuir um valor de texto ao TextField (escrever dentro do campo)
                    //No caso o TextField receber o valor que estiver na dataNascimento, que por sua vez é
                    //alterado ao escolher uma data no calendário
                    controller: controllerData,
                    readOnly: true,
                    style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        decorationThickness: 0),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                        hintText: "Informe a data de nascimento",
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.date_range),
                        prefixIconColor: Colors.white,
                        //Adicionando o ícone da senha (ao final do TextField)
                        suffixIcon: IconButton(
                          icon:
                              const Icon(Icons.ads_click, color: Colors.white),
                          onPressed: () {
                            abrirCalendario();
                          },
                        ),
                        suffixIconColor: Colors.white,
                        labelText: "Data de nascimento",
                        labelStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        //Borda padrão ao abrir a tela
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        //Borda ao clicar sobre (habilitar) o componente
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onChanged: (value) => {},
                  ),
                  //Décimo quinto componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
                  //Décimo sexto componente é um botão dentro de uma linha com
                  //o componente Expanded para ocupar toda a lateral da tela
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () async => {
                                    if (nome.isEmpty ||
                                        sobrenome.isEmpty ||
                                        email.isEmpty ||
                                        senha.isEmpty ||
                                        dataNascimento == null ||
                                        telefone.isEmpty)
                                      {
                                        snackBar = const SnackBar(
                                            content: Text(
                                                "Preencha todos os campos")),
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar),
                                      }
                                    else
                                      {
                                        u = Usuario.cadastrar(
                                            email,
                                            senha,
                                            nome,
                                            sobrenome,
                                            dataNascimento,
                                            telefone),
                                        if (await u.cadastrarUsuario())
                                          {
                                            snackBar = const SnackBar(
                                                content:
                                                    Text("Usuário cadastrado")),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar),
                                            limparCampos()
                                          }
                                      }
                                  },
                              child: const Text(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  "Cadastrar")))
                    ],
                  ),
                  //Décimo sétimo, outro botão dentro da Row e do Expanded
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
