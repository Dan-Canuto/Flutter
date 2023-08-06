import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:thorp_gerenciamento/pages/detalhes_page.dart';
import '../main.dart';
import '../models/processos.dart';

class ProcessosListItem extends StatelessWidget {
  const ProcessosListItem({
    Key? key,
    required this.processo,
    required this.detalhe,
  }) : super(key: key);

  final Processo processo;
  final Function(Processo) detalhe;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          extentRatio: 0.5,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              flex: 2,
              onPressed: (_) {
                detalhe(processo);
              },
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(46, 49, 75, 1),
              icon: Icons.visibility,
              label: 'Detalhes',
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              flex: 2,
              onPressed: (_) {
                detalhe(processo);
              },
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(46, 49, 75, 1),
              icon: Icons.monetization_on,
              label: 'Financeiro',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(46, 49, 75, 100),
                  blurRadius: 2,
                  offset: Offset(
                    4,
                    4,
                  )),
            ],
            border: Border.all(
                width: 5, color: const Color.fromRGBO(46, 49, 75, 1)),
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                processo.agente,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              Text(
                processo.empresa,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
