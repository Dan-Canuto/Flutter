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
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_return),
            )
          ],
          backgroundColor: Color.fromRGBO(46, 49, 75, 1),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
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
                              color: Color.fromARGB(255, 141, 131, 131),
                              blurRadius: 4,
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
                    Flexible(
                      child: ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text("Informações do Processo"),
                                Text(proc!.agente),
                                Text(proc!.empresa),
                                Text(proc!.referencia),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("Datas"),
                                Text(
                                    "Data de Embarque: ${DateFormat('dd/MM/yyyy').format(proc!.dataEmbarque.toDate())}"),
                                Text(proc!.dataChegada != null
                                    ? "Data de Chegada: ${DateFormat('dd/MM/yyyy').format(proc!.dataChegada!.toDate())}"
                                    : 'Data de Chegada: Não Cadastrada'),
                                Text(
                                    "Data da previsão de chegada: ${DateFormat('dd/MM/yyyy').format(proc!.dataPrevChegada.toDate())}"),
                                Row(
                                  children: [
                                    Text("Status da Chegada: "),
                                    Checkbox(
                                        value: proc!.statusChegada,
                                        onChanged: null),
                                  ],
                                ),
                                Checkbox(
                                    value: proc!.statusConcluido,
                                    onChanged: null),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
