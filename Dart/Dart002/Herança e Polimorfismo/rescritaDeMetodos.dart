void main() {
  Cachorro dog = Cachorro();
  dog.idade = 16;
  dog.nome = 'Nega';
  dog.comer();
  dog.dormir();
  dog.latir();

  Object object = Object();
  object.hashCode;
  object.runtimeType;
  object.toString();
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

  //Reescrevendo
  @override
  void dormir() {
    print('Dormiu roncando muito!!!');
  }

  @override
  String toString() {
    return 'Cachorro - nome: $nome\n idade: $idade';
  }
}
