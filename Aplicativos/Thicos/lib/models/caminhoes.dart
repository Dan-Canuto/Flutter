class Caminhao {
  final String modelo;
  final String placa;
  final String status;
  final String foto;

  Caminhao(this.modelo, this.placa, this.status, this.foto);

  Caminhao.fromJson(Map<String, dynamic> json)
      : modelo = json['modelo'],
        placa = json['placa'],
        status = json['status'],
        foto = json['foto'];

  Map<String, dynamic> toJson() {
    return {
      'modelo': modelo,
      'placa': placa,
      'status': status,
      'foto': foto,
    };
  }
}
