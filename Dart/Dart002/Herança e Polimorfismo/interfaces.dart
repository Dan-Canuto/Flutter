void main(List<String> args) {
  RepositorioPessoas repo = RepositorioPessoasRemote();
  repo.ler(10);
  repo.adicionar('Danilo');
  repo.apagar(5);
}

abstract class RepositorioPessoas {
  String ler(int i);
  void adicionar(String nome);
  void apagar(int i);
  void apagarTodos();
}

class RepositorioPessoasRemote implements RepositorioPessoas {
  String ler(int i) {
    return 'Danilo';
  }

  void adicionar(String nome) {}

  void apagar(int i) {}

  void apagarTodos() {}
}

class RepositorioPessoasLocal implements RepositorioPessoas {
  String ler(int i) {
    return 'Danilo';
  }

  void adicionar(String nome) {}

  void apagar(int i) {}

  void apagarTodos() {}
}
