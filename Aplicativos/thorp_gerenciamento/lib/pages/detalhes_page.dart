import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:thorp_gerenciamento/main.dart';

import '../models/processos.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({
    super.key,
  });
  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text(
            "THORP",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/a',
                );
              },
              icon: const Icon(Icons.keyboard_return),
            )
          ],
          backgroundColor: Color.fromRGBO(46, 49, 75, 1),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 141, 131, 131),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Color.fromRGBO(46, 49, 75, 1),
                  ),
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Detalhes do processo",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                flex: 14,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(36, 37, 51, 0.678),
                          blurRadius: 8,
                          offset: Offset(
                            0,
                            8,
                          )),
                    ],
                    border: Border.all(
                        color: Color.fromRGBO(46, 49, 75, 1), width: 8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Agente: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    proc?.agente != null
                                        ? proc!.agente
                                        : "Não inserido",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Empresa: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    proc?.empresa != null
                                        ? proc!.empresa
                                        : "Não inserido",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Nº de ref: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    proc?.referencia != null
                                        ? proc!.referencia
                                        : "Não inserido",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Data de embarque: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    proc?.dataEmbarque != null
                                        ? DateFormat('dd/MM/yyyy')
                                            .format(proc!.dataEmbarque.toDate())
                                        : 'Não Cadastrada',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Previsao de chegada: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    proc?.dataPrevChegada != null
                                        ? DateFormat('dd/MM/yyyy').format(
                                            proc!.dataPrevChegada!.toDate())
                                        : 'Não Cadastrada',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Data de chegada: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    proc?.dataChegada != null
                                        ? DateFormat('dd/MM/yyyy')
                                            .format(proc!.dataChegada!.toDate())
                                        : 'Não Cadastrada',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Info do embarque: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    proc?.infoEmbarque != null
                                        ? proc!
                                            .infoEmbarque //Alteração de quebra de linha
                                        : "Não inserido",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Porto de origem: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    proc?.portoOrigem != null
                                        ? proc!.portoOrigem
                                        : "Não informado",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Porto de chegada: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    proc?.portoChegada != null
                                        ? proc!.portoChegada
                                        : "Não informado",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        alignment: Alignment.bottomRight,
                        child: Text("Concluido"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
