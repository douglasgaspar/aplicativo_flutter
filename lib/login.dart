import 'package:app_completo/models/usuario.dart';
import 'package:app_completo/tela_cadastro.dart';
import 'package:app_completo/tela_esqueceu_senha.dart';
import 'package:app_completo/valores.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  String? usuario;
  String? senha;
  bool senhaEscondida = true;

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar;
    Usuario u;

    return Scaffold(
        backgroundColor: Valores.corFundo,
        //Ajuste da tela quando o teclado subir para digitar
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Valores.corFundo,
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
                    topLeft: Radius.circular(20), topRight: Radius.circular(0)),
              ),
              //Os comandos acima foram só para personalizar (cor, tamanho, efeitos) o Container
              //Agora será configurado o conteúdo e componentes dentro do Container
              //A tela foi configurada como 1 coluna. A Coluna pode ter vários componentes (children)
              child: Column(
                children: [
                  //Primeiro componente da coluna (uma linha para adicionar a imagem centralizada)
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Adicionando a imagem
                        Image.asset("assets/images/logotipo.png", width: 200)
                      ]),
                  //Segundo componente é um Padding só para dar espaçamento entre os componentes
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60)),
                  //Terceiro componente é um texto
                  const Text(
                    "Tela de login",
                    //Personalização do texto (cor, tamanho e estilo)
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  //Quarto componente é um Padding
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  //Quinto componente é um campo de entrada onde o usuário pode digitar algo
                  TextField(
                    //Configuração do texto interno
                    style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        decorationThickness: 0),
                    //Configuração do estilo do TextField (ícones, borda, espaçamento, hint...)
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                        //Hint
                        hintText: "Informe o usuário",
                        //Estilo/cor do hint
                        hintStyle: const TextStyle(color: Colors.white),
                        //Ícone que fica à esquerda do TextField
                        prefixIcon: const Icon(Icons.person),
                        prefixIconColor: Colors.white,
                        //Texto que aparece acima do TextField ao clicar nele
                        labelText: "Usuário",
                        //Configuração do texto do label
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
                    onChanged: (value) => {
                      setState(() {
                        usuario = value;
                      }),
                    },
                  ),
                  //Sextp componente
                  const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                  //Sétimo componente
                  TextField(
                    //ObscureText indica se o valor do campo será ou não escondido ao digitar
                    obscureText:
                        senhaEscondida, //Variável bool que altera ao clicar sobre o ícone do olho
                    style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        decorationThickness: 0),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                        hintText: "Informe a senha",
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.password),
                        prefixIconColor: Colors.white,
                        //Adicionando o ícone da senha (ao final do TextField)
                        suffixIcon: IconButton(
                          icon:
                              senhaEscondida //Verificação se o valor está true ou false
                                  ? const Icon(
                                      Icons
                                          .visibility, //Se true, coloca o ícone do olho
                                      color: Colors.white)
                                  : const Icon(
                                      Icons
                                          .visibility_off, //Se falso, coloca o ícone do olho com o risco
                                      color: Colors.white),
                          onPressed: () {
                            //Ao apertar sobre o ícone do olho, altera o estado entre verdadeiro e falso
                            setState(() {
                              senhaEscondida = !senhaEscondida;
                            });
                          },
                        ),
                        suffixIconColor: Colors.white,
                        labelText: "Senha",
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
                    onChanged: (value) => {
                      setState(() {
                        senha = value;
                      }),
                    },
                  ),
                  //Oitavo componente
                  const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
                  //Nono componente
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () async => {
                                    if (usuario!.isEmpty || senha!.isEmpty)
                                      {
                                        snackBar = const SnackBar(
                                            content: Text(
                                                "Preencha todos os campos")),
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar),
                                      }
                                    else
                                      {
                                        u = Usuario.login(usuario, senha),
                                        if (await u.validarAcesso())
                                          {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const EsqueceuSenha()))
                                          }
                                        else
                                          {
                                            snackBar = const SnackBar(
                                                content: Text(
                                                    "Usuário ou senha incorreta")),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar),
                                          }
                                      }
                                  },
                              child: const Text(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  "Acessar")))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TelaCadastro()))
                                  },
                              child: const Text(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  "Cadastrar")))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EsqueceuSenha()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Text(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  "Esqueceu a senha?")),
                        ],
                      )),
                ],
              ),
            )));
  }
}
