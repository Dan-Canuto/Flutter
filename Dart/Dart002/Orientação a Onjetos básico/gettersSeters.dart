void main(List<String> args) {
  Pessoa pessoa = Pessoa(nome: 'Danilo', idade: 21);

  pessoa.dinheiro = 300;

  print(pessoa.dinheiro);
}

class Pessoa {
  Pessoa({required this.nome, required this.idade, this.casado = false}) {
    print('Criando o $nome com idade $idade');
  }

  String nome;
  int idade;
  bool casado;

  double? _dinheiro;

  set dinheiro(double? valor) {
    if (valor != null && valor >= 0 && valor < 100000) {
      print('Modificando dinheiro do $nome');
      _dinheiro = valor;
    }
  }

  double? get dinheiro {
    print('Lendo dinheiro do $nome');
    return _dinheiro;
  }
}
