import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Processo {
  final String referencia;
  final String agente;
  final String empresa;

  final Timestamp dataEmbarque;
  final Timestamp dataPrevChegada;
  Timestamp? dataChegada;
  Timestamp? dataPagamento;

  bool statusChegada = false;
  final String infoEmbarque;
  final String portoOrigem;
  final String portoChegada;

  //Financeiro
  final String comissFrete;
  final String comissDestino;
  final String comissArmazenagem;
  String? cotacaoDolar;

  final Timestamp dataPrevPagamento;
  bool statusPagamento = false;
  bool statusConcluido = false;

  Processo(
    this.referencia,
    this.agente,
    this.empresa,
    this.dataEmbarque,
    this.dataPrevChegada,
    this.comissFrete,
    this.comissDestino,
    this.comissArmazenagem,
    this.dataPrevPagamento,
    this.cotacaoDolar,
    this.dataChegada,
    this.dataPagamento,
    this.infoEmbarque,
    this.portoOrigem,
    this.portoChegada,
  );

  Processo.fromJson(Map<String, dynamic> json)
      : referencia = json['referencia'],
        agente = json['agente'],
        empresa = json['empresa'],
        dataEmbarque = json['dataEmbarque'],
        dataPrevChegada = json['dataPrevChegada'],
        dataChegada = null,
        dataPagamento = null,
        statusChegada = json['statusChegada'],
        statusPagamento = json['statusPagamento'],
        statusConcluido = json['statusConcluido'],
        infoEmbarque = json['infoEmbarque'],
        portoOrigem = json['portoOrigem'],
        portoChegada = json['portoChegada'],
        comissFrete = json['comissfrete'],
        comissDestino = json['comissDestino'],
        comissArmazenagem = json['comissArmazenagem'],
        cotacaoDolar = json['cotacao Dolar'],
        dataPrevPagamento = json['dataPrevPagamento'];

  Map<String, dynamic> toJson() {
    return {
      'referencia': referencia,
      'agente': agente,
      'empresa': empresa,
      'dataEmbarque': dataEmbarque,
      'dataPrevChegada': dataPrevChegada,
      'dataChegada': '',
      'dataPagamento': '',
      'statusChegada': statusChegada,
      'statusPagamento': statusPagamento,
      'statusConcluido': statusConcluido,
      'infoEmbarque': infoEmbarque,
      'portoOrigem': portoOrigem,
      'portoChegada': portoChegada,
      'comissFrete': comissFrete,
      'comissDestino': comissDestino,
      'comissArmazenagem': comissArmazenagem,
      'cotacao Dolar': '',
      'dataPrevPagamento': dataPrevPagamento,
    };
  }
}
