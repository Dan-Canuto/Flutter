import 'classesObjetosAtributos.dart';

void main(List<String> args) {
  Pessoa pessoa = Pessoa(nome: 'Danilo', idade: 21);

  Pessoa pessoa1 = Pessoa.casada(nome: 'Danilo', idade: 21);
}

class Pessoa {
  Pessoa({required this.nome, required this.idade, this.casado = false}) {
    print('Criando o $nome com idade $idade');
  }

  Pessoa.casada({required this.nome, required this.idade, this.casado = true}) {
    casado = true;
  }

  String nome;
  int idade;
  bool casado;
}
