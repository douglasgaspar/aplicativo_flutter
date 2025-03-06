//Biblioteca para conseguir converter JSON
import 'dart:convert';
//Biblioteca adicionada para usar a conexão via HTTP
import 'package:http/http.dart' as http;
//Biblioteca para converter a senha em SHA256 (criptografar)
import 'package:crypto/crypto.dart';

class Usuario {
  int? id;
  String? email;
  String? senha;
  String? nome;
  String? sobrenome;
  DateTime? dataNascimento;
  String? telefone;

  //URL da api
  String url = "http://10.0.2.2:3000/";

  //Construtor vazio da classe
  Usuario();

  //Construtor para usar quando for cadastrar um usuário
  Usuario.cadastrar(this.email, this.senha, this.nome, this.sobrenome,
      this.dataNascimento, this.telefone);

  //Construtor para usar quando for fazer login do usuário
  Usuario.login(this.email, this.senha);

  //Construtor para usar quando for alterar a senha
  Usuario.alterarSenha(this.email, this.senha);

  //Construtor que será usado para receber dados em JSON e criar um usuário
  //Utilizado ao buscar todos os usuários
  Usuario.convertJson(Map<String, dynamic> conteudoJSON)
      //Indicando que o atributo id irá ser recuperado do campo "id" do "conteudoJson" e convertido para int
      : id = int.parse(conteudoJSON['id'].toString()),
        email = conteudoJSON['email'] as String,
        senha = conteudoJSON['senha'] as String,
        nome = conteudoJSON['nome'] as String,
        sobrenome = conteudoJSON['sobrenome'] as String,
        dataNascimento = DateTime(conteudoJSON['dataNascimento']),
        telefone = conteudoJSON['telefone'].toString();

  //Criar método que irá retornar bool e será executado para conectar no backend
  //O Future indica que a execução da função deverá retornar algo somente quando o processo
  //do método estiver completo, ou seja, irá retornar só mais tarde ou futuramente
  //Para fazer sentido a espera "futura" o async deve ser indicado no método
  //Por fim o "await" deve ser indicado aonde queremos "aguardar" o processamento
  Future<bool> cadastrarUsuario() async {
    final respostaBackend = await http.post(
      Uri.parse("${url}cadastrar"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      //Monta os dados a ser enviado no Body
      body: jsonEncode(<String, String>{
        'email': email.toString(),
        'senha': sha256.convert(utf8.encode(senha.toString())).toString(),
        'nome': nome.toString(),
        'sobrenome': sobrenome.toString(),
        'dataNasc': dataNascimento.toString(),
        'telefone': telefone.toString()
      }),
    );
    //Se retornou código 200, então cadastrou o produto
    if (respostaBackend.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //Método para fazer a validação dos dados de email e senha
  Future<bool> validarAcesso() async {
    final respostaBackend = await http.post(
      Uri.parse("${url}validarAcesso"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      //Monta os dados a ser enviado no Body
      body: jsonEncode(<String, String>{
        'email': email.toString(),
        'senha': sha256.convert(utf8.encode(senha.toString())).toString()
      }),
    );
    //Se retornou código 200, então cadastrou o produto
    if (respostaBackend.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //Método utilizado quando o usuário pede para alterar a senha
  Future<bool> atualizarSenha() async {
    final respostaBackend = await http.put(
      Uri.parse("${url}atualizarSenha"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      //Monta os dados a ser enviado no Body
      body: jsonEncode(<String, String>{
        'email': email.toString(),
        'senha': sha256.convert(utf8.encode(senha.toString())).toString()
      }),
    );
    //Se retornou código 200, então cadastrou o produto
    if (respostaBackend.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
