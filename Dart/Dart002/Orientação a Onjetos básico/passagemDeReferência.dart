void main(List<String> args) {
  Pessoa pessoa1 = Pessoa(nome: 'Danilo', idade: 21);
  print(pessoa1.nome);
  print(pessoa1.idade);

  Pessoa pessoa2 = Pessoa(nome: 'Canuto', idade: 22);
  print(pessoa2);
  print(pessoa2.idade);

  funcao1(pessoa1);

  int numero = 10;
  funcao(numero);
  print(numero);
}

void funcao1(Pessoa pessoa) {
  pessoa.idade++;
}

void funcao(int x) {
  x = 20;
}

class Pessoa {
  Pessoa({required this.nome, required this.idade});

  String nome;
  int idade;
}
