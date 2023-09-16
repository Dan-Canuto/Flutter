import 'package:cloud_firestore/cloud_firestore.dart';

class Manutencao {
  final bool ativo;
  final String caminhao;
  final String componente;
  final Timestamp dataRealizacao;
  final Timestamp dataVencimento;
  final String mecanico;
  final String notaFiscal;
  final String observacao;
  final num valor;

  Manutencao(
    this.ativo,
    this.caminhao,
    this.componente,
    this.dataRealizacao,
    this.dataVencimento,
    this.mecanico,
    this.notaFiscal,
    this.observacao,
    this.valor,
  );

  Manutencao.fromJson(Map<String, dynamic> json)
      : ativo = json['ativo'],
        caminhao = json['caminhao'],
        componente = json['componente'],
        dataRealizacao = json['dataRealizacao'],
        dataVencimento = json['dataVencimento'],
        mecanico = json['mecanico'],
        notaFiscal = json['notaFiscal'],
        observacao = json['observacao'],
        valor = json['valor'];

  Map<String, dynamic> toJson() {
    return {
      'ativo': ativo,
      'caminhao': caminhao,
      'componente': componente,
      'dataRealizacao': dataRealizacao,
      'dataVencimento': dataVencimento,
      'mecanino': mecanico,
      'notaFiscal': notaFiscal,
      'observacao': observacao,
      'valor': valor,
    };
  }
}
