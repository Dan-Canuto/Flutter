void main(List<String> args) {
  const nome = 'Danilo';
  const idade = 40 + 30;
  const lista = ['Danilo', 'Canuto'];

  final DateTime agora = DateTime.now();
  final String sobrenome;
  if (nome == 'Danilo') {
    sobrenome = 'Canuto';
  } else {
    print('Não sei');
  }
}
