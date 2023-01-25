void main(List<String> args) {
  Pessoa pessoa = Pessoa(nome: 'Danilo', idade: 21);

  String? nome = pessoa.nomeSecreto;

  if (nome != null) {
    print(nome.toUpperCase());
  }
}

class Pessoa {
  Pessoa({required this.nome, required this.idade, this.casado = false}) {
    print('Criando o $nome com idade $idade');
  }

  String nome;
  int idade;
  bool casado;

  String? _nomeSecreto = 'Flutter';

  get nomeSecreto {
    String? nome = _nomeSecreto;
    if (nome != null) {
      _nomeSecreto = null;
      return nome;
    } else {
      return null;
    }
  }

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
