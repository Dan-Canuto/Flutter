import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Processo {
  String referencia;
  String agente;
  String empresa;

  Timestamp dataEmbarque;
  Timestamp dataPrevChegada;
  Timestamp? dataChegada;
  Timestamp? dataPagamento;

  String infoEmbarque;
  String portoOrigem;
  String portoChegada;

  //Financeiro
  String comissFreteCompra;
  String comissFreteVenda;
  String comissDestino;
  String comissArmazenagem;
  String cotacaoDolar;
  String status;

  Timestamp dataPrevPagamento;
  bool statusPagamento;

  Processo(
      this.referencia,
      this.agente,
      this.empresa,
      this.dataEmbarque,
      this.dataPrevChegada,
      this.comissFreteCompra,
      this.comissFreteVenda,
      this.comissDestino,
      this.comissArmazenagem,
      this.dataPrevPagamento,
      this.dataChegada,
      this.dataPagamento,
      this.infoEmbarque,
      this.portoOrigem,
      this.portoChegada,
      {this.status = "1",
      this.cotacaoDolar = "1",
      this.statusPagamento = false});

  Processo.fromJson(Map<String, dynamic> json)
      : referencia = json['referencia'],
        agente = json['agente'],
        empresa = json['empresa'],
        dataEmbarque = json['dataEmbarque'],
        dataPrevChegada = json['dataPrevChegada'],
        dataChegada = null,
        dataPagamento = null,
        statusPagamento = json['statusPagamento'],
        status = json['status'],
        infoEmbarque = json['infoEmbarque'],
        portoOrigem = json['portoOrigem'],
        portoChegada = json['portoChegada'],
        comissFreteCompra = json['comissfreteCompra'],
        comissFreteVenda = json['comissfreteVenda'],
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
      'statusPagamento': statusPagamento,
      'status': status,
      'infoEmbarque': infoEmbarque,
      'portoOrigem': portoOrigem,
      'portoChegada': portoChegada,
      'comissFreteCompra': comissFreteCompra,
      'comissFreteVenda': comissFreteVenda,
      'comissDestino': comissDestino,
      'comissArmazenagem': comissArmazenagem,
      'cotacao Dolar': '',
      'dataPrevPagamento': dataPrevPagamento,
    };
  }
}
