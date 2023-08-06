import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:thorp_gerenciamento/pages/detalhes_page.dart';
import 'package:thorp_gerenciamento/widgets/processos_list_item.dart';

import '../main.dart';
import '../models/processos.dart';

class ProcessosPage extends StatefulWidget {
  const ProcessosPage({super.key});

  @override
  State<ProcessosPage> createState() => _ProcessosPageState();
}

class _ProcessosPageState extends State<ProcessosPage> {
  List<Processo> procItems = [];

  void initState() {
    fetchRecords();
    FirebaseFirestore.instance
        .collection('Processos')
        .snapshots()
        .listen((records) {
      mapRecords(records);
    });
    super.initState();
  }

  fetchRecords() async {
    var records =
        await FirebaseFirestore.instance.collection('Processos').get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map(
          (proc) => Processo(
            proc['referencia'],
            proc['agente'],
            proc['empresa'],
            proc['dataEmbarque'],
            proc['dataPrevChegada'],
            proc['comissFreteCompra'],
            proc['comissFreteVenda'],
            proc['comissDestino'],
            proc['comissArmazenagem'],
            proc['dataPrevPagamento'],
            proc['dataChegada'],
            proc['dataPagamento'],
            proc['infoEmbarque'],
            proc['portoOrigem'],
            proc['portoChegada'],
            cotacaoDolar: proc['cotacaoDolar'],
            status: proc['status'],
            statusPagamento: proc['statusPagamento'],
          ),
        )
        .toList();
    if (this.mounted) {
      setState(() {
        procItems = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(111, 88, 75, 131),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Color.fromRGBO(46, 49, 75, 1),
                      ),
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Lista de Processos",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              alignment: Alignment.topCenter,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: procItems.length,
                itemBuilder: (context, index) {
                  return ProcessosListItem(
                    processo: procItems[index],
                    detalhe: detalhe,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void detalhe(Processo proce) {
    setState(() {
      Navigator.pushReplacementNamed(
        context,
        '/d',
      );
      proc = proce;
    });
  }
}
