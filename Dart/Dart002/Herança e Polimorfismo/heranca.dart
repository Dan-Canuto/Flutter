void main() {
  Cachorro dog = Cachorro();
  dog.idade = 16;
  dog.nome = 'Nega';
  dog.comer();
  dog.dormir();
  dog.latir();
}

class Animal {
  String? nome;
  int? idade;

  void comer() {
    print('Comeu');
  }

  void dormir() {
    print('Dormiu');
  }
}

class Cachorro extends Animal {
  void latir() {
    print("au au");
  }
}
