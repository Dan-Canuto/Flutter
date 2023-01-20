import 'dart:convert';

void main(List<String> args) {
  Map<String, dynamic> dados = json.decode(dadosDoUsuario());

  print(dados['cursos'][0]['dificuldade']);
}

String dadosDoUsuario() {
  return """
{
    "nome" : "Danilo",
    "sobrenome" : "Canuto",
    "idade" : 50,
    "casado" : false,
    "altura" : 1.86,
    "cursos" : [
        {
            "Nome":"Dart",
            "Dificuldade:" : 1
        },
        {
            "Nome":"Flutter",
            "Dificuldade:" : 2
        }
    ],
    "Endereço": {
        "cidade" : "São Paulo",
        "pais" : "Brasil",
        "numero" : 100
    }
}


""";
}
