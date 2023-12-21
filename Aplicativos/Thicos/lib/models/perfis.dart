class Perfil {
  final String nome;
  final String login;
  final String senha;

  final String permissao;

  Perfil(
    this.nome,
    this.login,
    this.senha,
    this.permissao,
  );

  Perfil.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        login = json['login'],
        senha = json['senha'],
        permissao = json['permissao'];

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'login': login,
      'senha': senha,
      'permissao': permissao,
    };
  }
}
