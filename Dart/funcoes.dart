import 'dart:ffi';
import 'dart:html';
import 'dart:math';
import 'dart:svg';

void main(List<String> args) {}

class Republicas {
  Republicas({
    required this.nome,
  });

  String nome;
  List<Moradores> moradoresRep = [];
  List<Moradores> bixos = [];

  void adicionarMorador(Moradores morador) {
    moradoresRep.add(morador);

    if (DateTime.now().year == morador.anoEntrada) {
      bixos.add(morador);
    }
  }

  void calcularPeso() {
    List<int> aux = [];
    void listaAux(Moradores morador) {
      if (!(aux.contains(morador.anoEntrada))) {
        aux.add(morador.anoEntrada);
      }
    }

    moradoresRep.map((e) => listaAux(e));
    aux
      ..sort()
      ..reversed;
    for (int i = 1; i < (aux.length + 1); i++) {
      moradoresRep
          .where((e) => aux[i - 1] == e.anoEntrada)
          .map((e) => e.peso = i);
    }
    bixos.map((e) => e.peso += 1);
  }
}

class Moradores {
  Moradores({
    required this.nome,
    required this.apelido,
    required this.anoEntrada,
  });

  String nome;
  String apelido;
  int anoEntrada;

  late int peso;
}

class Tarefas {
  Tarefas({
    required this.titulo,
    required this.desc,
    required this.dataFinal,
    required this.qtdRealizadores,
    required this.republica,
    required this.tempoVotacao,
  }) {
    designarRealizador(republica.moradoresRep);
  }

  Republicas republica;
  String titulo;
  String desc;
  DateTime dataFinal;
  DateTime tempoVotacao;
  int qtdRealizadores;
  List<Moradores> realizadores = [];
  int votacao = 0;

  void designarRealizador(List<Moradores> moradores) {
    for (var i = 0; i < qtdRealizadores; i++) {
      int soma = 0;
      moradores.map((e) => soma += e.peso);
      int sorteado = Random().nextInt(soma);
      for (var morador in moradores) {
        sorteado -= morador.peso;
        if (sorteado <= 0) {
          realizadores.add(morador);
          break;
        }
      }
    }
  }
}
