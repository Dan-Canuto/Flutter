void main() {
  Cachorro dog = Cachorro();
  dog.idade = 16;
  dog.nome = 'Nega';
  dog.comer();
  dog.dormir();
  dog.latir();

  Gato gato = Gato();
  gato.idade = 25;
  gato.nome = 'Nem';
  gato.comer();
  gato.dormir();
  gato.miar();

  List<Animal> animais = [];
  animais.add(dog);
  animais.add(gato);

  Cachorro animal = funcao() as Cachorro;
  animal.latir();
}

Animal funcao() {
  return Cachorro();
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

class Gato extends Animal {
  void miar() {
    print('miau');
  }
}
