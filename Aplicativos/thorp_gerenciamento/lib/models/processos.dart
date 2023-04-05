import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Processos {
  final String referencia;
  final String agente;
  final String empresa;

  final Timestamp dataEmbarque;
  final Timestamp dataPrevChegada;
  late Timestamp? dataChegada;
  late Timestamp? dataPagamento;

  bool statusChegada = false;
  late List infoEmbarque;

  //Financeiro
  final String valorPrevisto;
  final Timestamp dataPrevPagamento;
  bool statusPagamento = false;

  Processos(this.referencia, this.agente, this.empresa, this.dataEmbarque,
      this.dataPrevChegada, this.valorPrevisto, this.dataPrevPagamento);

  Processos.fromJson(Map<String, dynamic> json)
      : referencia = json['referencia'],
        agente = json['agente'],
        empresa = json['empresa'],
        dataEmbarque = json['dataEmbarque'],
        dataPrevChegada = json['dataPrevChegada'],
        dataChegada = null,
        dataPagamento = null,
        statusChegada = json['statusChegada'],
        statusPagamento = json['statusPagamento'],
        infoEmbarque = json['infoEmbarque'],
        valorPrevisto = json['valorPrevisto'],
        dataPrevPagamento = json['dataPrevPagamento'];

  Map<String, dynamic> toJson() {
    return {
      'referencia': referencia,
      'agente': agente,
      'empresa': empresa,
      'dataEmbarque': dataEmbarque,
      'dataPrevChegada': dataPrevChegada,
      'dataChegada': dataChegada,
      'dataPagamento': dataPagamento,
      'statusChegada': statusChegada,
      'statusPagamento': statusPagamento,
      'infoEmbarque': infoEmbarque,
      'valorPrevisto': valorPrevisto,
      'dataPrevPagamento': dataPrevPagamento,
    };
  }
}
