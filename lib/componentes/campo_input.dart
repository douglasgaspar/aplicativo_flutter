import 'package:flutter/material.dart';

class CampoInput extends StatelessWidget {
  final Function(String)? aoDigitar;
  final String textoHint;
  final String textoLabel;
  final Icon iconeInput;
  final bool campoSenha;
  final TextEditingController controller;

  const CampoInput(
      {super.key,
      required this.aoDigitar,
      required this.textoHint,
      required this.textoLabel,
      required this.iconeInput,
      required this.campoSenha,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      //Controller para acessar o EditText e poder editar o seu conteúdo
      controller: controller,
      //Indicação se o campo é de senha ou não
      obscureText: campoSenha,
      //Configuração do texto interno
      style: const TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          decorationThickness: 0),
      //Configuração do estilo do TextField (ícones, borda, espaçamento, hint...)
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
          //Hint
          hintText: textoHint,
          //Estilo/cor do hint
          hintStyle: const TextStyle(color: Colors.white),
          //Ícone que fica à esquerda do TextField
          prefixIcon: iconeInput,
          prefixIconColor: Colors.white,
          //Texto que aparece acima do TextField ao clicar nele
          labelText: textoLabel,
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
      onChanged: aoDigitar,
    );
  }
}
