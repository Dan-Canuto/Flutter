void main(List<String> args) {
  saudacoes('Danilo');

  int? numero;

  // snumero + 10; // o código não deixa usar as variaveis nulas
}

void saudacoes(String nome, {bool mostrarAgora = true, String? cliente}) {
  // ? = variavel pode ser  nula
  print('Saudações do ${nome.toLowerCase()}');

  String c = cliente ?? 'Não informado';
  print('Seja bem0vindo(a), ${c.toUpperCase()}');

  if (cliente != null) {
    // como o if confere se a variavel é nula o código permite a
    // utilização de funções em uma variaveis que admite valor nulo
    print('Seja bem-vindo(a), ${cliente.toUpperCase()}!');
  }
}
