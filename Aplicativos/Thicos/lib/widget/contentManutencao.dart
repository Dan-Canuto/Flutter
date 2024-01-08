import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/caminhoes.dart';
import '../models/manutencao.dart';

class ContentManutencao extends StatefulWidget {
  const ContentManutencao({super.key, required this.name, required this.caminhao, required this.title});

  final String name;
  final String title;
  final Caminhao caminhao;


  @override
  State<ContentManutencao> createState() => _ContentManutencaoState();
}

class _ContentManutencaoState extends State<ContentManutencao> {
  List<Manutencao> filtroList = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: filtroManuItems(),
      builder: (BuildContext context,
          AsyncSnapshot<List<Manutencao>> snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 4, bottom: 8),
              padding: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(46, 49, 75, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black87,
                      blurRadius: 5,
                      offset: Offset(
                        0,
                        3,
                      )),
                ],
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 5, bottom: 5),
              color: Color.fromRGBO(46, 49, 75, 1),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Datas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                           Container(
                            margin:
                                EdgeInsets.only(top: 10),
                            child: Text(
                              'Realização',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy').format(filtroList[0].dataRealizacao.toDate()),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                           Container(
                            margin:
                                EdgeInsets.only(top: 10),
                            child: Text(
                              'Vencimento',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy').format(filtroList[0].dataVencimento.toDate()),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )                               
                    ],
                  ),
                ]
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 10),
              child: Text(
                'Mecânico',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              "${filtroList[0].mecanico}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 10),
              child: Text(
                'Observação',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              "${filtroList[0].observacao}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 10),
              child: Text(
                'Valor',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              "R\$ ${double.parse(filtroList[0].valor.toString()).toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10),
              padding: EdgeInsets.symmetric(vertical:10),

              color: Color.fromRGBO(46, 49, 75, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('Histórico')),
                  ElevatedButton(onPressed: (){}, child: Text('Nota Fiscal')),
                  ElevatedButton(onPressed: (){}, child: Text('Editar')),
                ],
              ),
            )

          ],
        );
      }
    );
  }


  //Funções
  Future<List<Manutencao>> filtroManuItems() async {
    fetchRecords();
    FirebaseFirestore.instance.collection(widget.name).snapshots().listen(
      (records) {
        mapRecords(records);
      },
    );
    return filtroList;
  }

  fetchRecords() async {
    var records = await FirebaseFirestore.instance
        .collection(widget.name)
        .where("caminhao", isEqualTo: widget.caminhao!.placa)
        .where("ativo", isEqualTo: true)
        .get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map(
          (manu) => Manutencao(
            manu['ativo'],
            manu['caminhao'],
            manu['dataRealizacao'],
            manu['dataVencimento'],
            manu['mecanico'],
            manu['notaFiscal'],
            manu['observacao'],
            manu['valor'],
          ),
        )
        .toList();
    if (this.mounted) {
      setState(
        () {
          // TODO: implement setState
          filtroList = list;
        },
      );
    }
  }
}

