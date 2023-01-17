void main(List<String> args) {
  String nome = upper('Danilo');

  String qtd = funcao(12) ?? 'Não informado';
  print(qtd);
}

String upper(String nome) => nome.toUpperCase();

String? funcao(int x) {
  if (x > 10) {
    return 'Ola mundo!';
  }
}
