import 'dart:ffi';

import 'package:flutter/material.dart';
import '../models/processos.dart';

class ProcessosListItem extends StatelessWidget {
  ProcessosListItem({
    Key? key,
    required this.referencia,
    required this.agente,
    required this.empresa,
    required this.dataEmbarque,
    required this.dataPrevChegada,
    required this.statusChegada,
    required this.statusPagamento,
    required this.valorPrevisto,
    required this.dataPrevPagamento,
  }) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
