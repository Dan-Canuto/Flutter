void main(List<String> args) {
  Pessoa.alturaPadrao = 1.80;
  Pessoa pessoa = Pessoa(nome: 'Danilo', idade: 21);

  pessoa.nome;

  print(pessoa.altura);
}

class Pessoa {
  Pessoa({required this.nome, required this.idade});

  String nome;
  int idade;
  double altura = alturaPadrao;

  void comer() {
    print('Comendo...');
  }

  static String atributoStatic = 'abc';

  static double alturaPadrao = 0;

  static String metodoStatic() {
    return 'Olá mundo $atributoStatic';
  }
}
