void main() {
  Movel movel = Carro();
  movel.direita();

  Vendivel vend = Geladeira();
  vend.preco();
}

abstract class Movel {
  void direita();
  void esquerda();
  void frente();
}

abstract class Vendivel {
  double preco();
}

class Pessoa implements Movel {
  String? nome;

  void direita() {}

  void esquerda() {}

  void frente() {}
}

class Carro implements Movel, Vendivel {
  String? modelo;

  double preco() {
    return 21.2;
  }

  void direita() {}

  void esquerda() {}

  void frente() {}
}

class Geladeira implements Vendivel {
  double preco() {
    return 1000;
  }
}
