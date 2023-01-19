void main(List<String> args) {
  List<String> nomes = ['Danilo', 'Canuto', 'Pereira', 'Otaviaono', 'Exemplo'];

  print(nomes);

  for (int i = 2; i < nomes.length - 1; i++) {
    print(nomes[i].toUpperCase());
  }

  for (String nome in nomes.sublist(2, 4)) {
    print(nome.toLowerCase());
  }

  nomes.sublist(2).forEach((nome) {
    print(nome.toLowerCase());
  });
}
