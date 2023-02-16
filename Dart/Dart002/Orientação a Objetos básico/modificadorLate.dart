void main(List<String> args) {
  Pessoa pessoa = Pessoa(nome: 'Danilo', idade: 20);

  pessoa.cpf = '50179145878';
  print(pessoa.cpf);

  print(pessoa.temperatura);
  print(pessoa.temperatura);
  print(pessoa.temperatura);
}

class Pessoa {
  Pessoa({required this.nome, required this.idade});

  String nome;
  int idade;

  late String cpf;

  late double temperatura = medirTemperatura();

  double medirTemperatura() {
    print('Mediu a temperatura');
    return 37.0;
  }
}
