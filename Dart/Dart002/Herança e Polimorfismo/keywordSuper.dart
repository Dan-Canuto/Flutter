void main() {
  Cachorro dog = Cachorro('Dog', 12);
  dog.comer();
  dog.dormir();
  dog.latir();
}

class Animal {
  Animal(this.nome, this.idade);

  String nome;
  int idade;

  void comer() {
    print('Comeu');
  }

  void dormir() {
    print('Dormiu');
  }
}

class Cachorro extends Animal {
  Cachorro(String nome, int idade) : super(nome, idade) {
    print('Criou o cachorro $nome');
  }

  void latir() {
    print("au au");
  }

  void dormir() {
    super.dormir();
    print("Rouncou");
  }
}
