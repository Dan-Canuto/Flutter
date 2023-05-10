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
  }) : super(key: key);

  final Processo processo;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              flex: 2,
              onPressed: (_) {
                Navigator.pushReplacementNamed(
                  context,
                  '/d',
                );
                proc = processo;
              },
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(46, 49, 75, 1),
              icon: Icons.visibility,
              label: 'Detalhes',
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
