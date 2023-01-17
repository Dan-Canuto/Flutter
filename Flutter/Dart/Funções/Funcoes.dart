void main() {
  saudacoes('Danilo', true, '*');

  saudacoes2('Danilo', mostrarAgora: false, sep: '*');

  String a = agora();

  print(a);
}

//Parametros funções
void saudacoes(String nome, [bool mostrarAgora = true, String sep = '-']) {
  print(sep * 20);
  print('Saudações do $nome');
  if (mostrarAgora) {
    print('Agora: ${agora()}');
  }
}

void saudacoes2(String nome, {bool mostrarAgora = true, required String sep}) {
  print(sep * 20);
  print('Saudações do $nome');
  if (mostrarAgora) {
    print('Agora: ${agora()}');
  }
}

//Return de funções
String agora() {
  DateTime agora = DateTime.now();
  return agora.toString();
}
