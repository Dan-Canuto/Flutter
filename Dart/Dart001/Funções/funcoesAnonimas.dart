import 'Funcoes.dart';

void main() {
  saudacoes('Danilo', corpo: funcao);
}

void funcao(int i) {
  for (int j = 0; j < i; j++) {
    print('Olá $j');
  }
}

void funcao2(int i) {
  for (int j = 10; j > i; j++) {
    print('Olá $j');
  }
}

void saudacoes(String nome, {required Function(int) corpo}) {
  corpo(6);
}
