void main(List<String> args) {
  Pessoa pessoa = Pessoa();

  pessoa.nome = 'Danilo';
  pessoa.idade = 21;

  print(pessoa.aniversario());

  pessoa.casar();
  print(pessoa.casado);

  pessoa.trocarNome('Canuto');
  print(pessoa.nome);
}

class Pessoa {
  String? nome;
  int? idade;
  bool casado = false;

  int? aniversario() {
    print('Parabéns! $nome');
    if (idade != null) {
      idade = idade! + 1;
    }
    return idade;
  }

  void casar() {
    casado = true;
  }

  void trocarNome(String n) {
    nome = n;
  }
}
