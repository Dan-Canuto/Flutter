import 'dart:ffi';

class Processos {
  final String referencia;
  final String agente;
  final String empresa;

  final DateTime dataEmbarque;
  final DateTime dataPrevChegada;
  late DateTime? dataChegada;
  late DateTime? dataPagamento;

  bool statusChegada = false;
  late List infoEmbarque;

  //Financeiro
  final Double valorPrevisto;
  final DateTime dataPrevPagamento;
  bool statusPagamento = false;

  Processos(this.referencia, this.agente, this.empresa, this.dataEmbarque,
      this.dataPrevChegada, this.valorPrevisto, this.dataPrevPagamento);

  Processos.fromJson(Map<String, dynamic> json)
      : referencia = json['referencia'],
        agente = json['agente'],
        empresa = json['empresa'],
        dataEmbarque = DateTime.parse(json['dataEmbarque']),
        dataPrevChegada = DateTime.parse(json['dataPrevChegada']),
        dataChegada = null,
        dataPagamento = null,
        statusChegada = json['statusChegada'],
        statusPagamento = json['statusPagamento'],
        infoEmbarque = json['infoEmbarque'],
        valorPrevisto = json['valorPrevisto'],
        dataPrevPagamento = DateTime.parse(json['dataPrevPagamento']);

  Map<String, dynamic> toJson() {
    return {
      'referencia': referencia,
      'agente': agente,
      'empresa': empresa,
      'dataEmbarque': dataEmbarque.toIso8601String(),
      'dataPrevChegada': dataPrevChegada.toIso8601String(),
      'dataChegada': dataChegada,
      'dataPagamento': dataPagamento,
      'statusChegada': statusChegada,
      'statusPagamento': statusPagamento,
      'infoEmbarque': infoEmbarque,
      'valorPrevisto': valorPrevisto,
      'dataPrevPagamento': dataPrevPagamento.toIso8601String(),
    };
  }
}
