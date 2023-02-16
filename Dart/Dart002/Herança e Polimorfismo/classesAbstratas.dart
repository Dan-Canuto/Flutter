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

  Animal animal1 = animais.first;
  if (animal1 is Cachorro) {
    animal1.latir();
  } else if (animal1 is Gato) {
    animal1.miar();
  }
}

Animal funcao() {
  return Cachorro();
}

abstract class Animal {
  String? nome;
  int? idade;

  void comer() {
    print('Comeu');
  }

  void dormir() {
    print('Dormiu');
  }

  void morrer();
}

class Cachorro extends Animal {
  void latir() {
    print("au au");
  }

  void morrer() {
    print('Muito triste');
  }
}

class Gato extends Animal {
  void miar() {
    print('miau');
  }

  void morrer() {
    print('Teste123');
  }
}
