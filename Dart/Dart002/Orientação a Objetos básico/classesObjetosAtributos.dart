void main() {
  Pessoa pessoa1 = Pessoa();
  pessoa1.nome = 'Danilo';
  pessoa1.idade = 40;
  print(pessoa1.nome);
  print(pessoa1.idade);

  Pessoa pessoa2 = Pessoa();
  pessoa2.nome = 'Canuto';
  pessoa2.idade = 21;
  pessoa2.casado = true;
  print(pessoa2.nome);
  print(pessoa2.idade);
}

class Pessoa {
  String? nome;
  int? idade;
  bool casado = false;
}
