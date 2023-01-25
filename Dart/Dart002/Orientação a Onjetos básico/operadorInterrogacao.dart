void main(List<String> args) {
  Pessoa pessoa = Pessoa(nome: 'Danilo', idade: 21);
  print(pessoa.nome);
  print(pessoa.idade);

  Pessoa? pessoa2;
  print(pessoa2?.nome.toLowerCase());
  print(pessoa2?.idade);
  print(pessoa2?.cidade?.toLowerCase());
  pessoa2?.comer();
}

class Pessoa {
  Pessoa({required this.nome, required this.idade});

  String nome;
  int idade;

  String? cidade;

  void comer() {
    print('Comendo');
  }
}
