import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thicos/models/caminhoes.dart';
import 'package:thicos/models/manutencao.dart';
import 'package:thicos/widget/caminhoesItems.dart';
import 'package:thicos/widget/manutencaoList.dart';
import 'package:firebase_core/firebase_core.dart';

class ManutencaoPage extends StatefulWidget {
  const ManutencaoPage(
      {super.key,
      required this.selecionado,
      required this.camItems,
      required this.manuItems});

  final Caminhao? selecionado;
  final List<Caminhao> camItems;
  final List<Manutencao> manuItems;

  @override
  State<ManutencaoPage> createState() => _ManutencaoPageState();
}

class _ManutencaoPageState extends State<ManutencaoPage> {
  @override
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Caminhao? select;
  List<Manutencao> filtroList = [];
  final TextEditingController selectController = TextEditingController();
  Widget build(BuildContext context) {
    if (widget.selecionado != null) {
      select = widget.selecionado!;
    }
    if (select == null) {
      return Container(
        color: Color.fromRGBO(149, 122, 86, 1),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 4, bottom: 12),
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
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
                  'MANUTENÇÃO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(46, 49, 75, 1),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(36, 37, 51, 0.678),
                        blurRadius: 8,
                        offset: Offset(
                          4,
                          8,
                        )),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Selecione a placa do caminhão',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                pesquisa();
                              },
                              cursorColor: Color.fromRGBO(46, 49, 75, 1),
                              controller: selectController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Informe o valor';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                pesquisa();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(149, 122, 86, 1),
                              ),
                              child: Text(
                                'PROCURAR',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.002,
                bottom: MediaQuery.of(context).size.height * 0.002),
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
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
              'MANUTENÇÃO',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color.fromRGBO(46, 49, 75, 1),
                width: 4,
              ),
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
                  ),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Placa',
                        style: TextStyle(
                            color: Color.fromRGBO(46, 49, 75, 1),
                            fontSize: 20,
                            fontFamily: "RobotoCondensed",
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        select!.placa,
                        style: TextStyle(
                          color: Color.fromRGBO(46, 49, 75, 1),
                          fontSize: 15,
                          fontFamily: "RobotoCondensed",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Modelo',
                        style: TextStyle(
                            color: Color.fromRGBO(46, 49, 75, 1),
                            fontSize: 20,
                            fontFamily: "RobotoCondensed",
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        select!.modelo,
                        style: TextStyle(
                          color: Color.fromRGBO(46, 49, 75, 1),
                          fontSize: 15,
                          fontFamily: "RobotoCondensed",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                            color: Color.fromRGBO(46, 49, 75, 1),
                            fontSize: 20,
                            fontFamily: "RobotoCondensed",
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        select!.status,
                        style: TextStyle(
                          color: Color.fromRGBO(46, 49, 75, 1),
                          fontSize: 15,
                          fontFamily: "RobotoCondensed",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          // FutureBuilder(
          //     future: filtroManuItems(),
          //     builder: (BuildContext context,
          //         AsyncSnapshot<List<Manutencao>> snapshot) {
          //       return manutencaoList(caminhao: select!);
          //     })
          ManutencaoList(caminhao: select!), //
        ],
      );
    }
  }

  

  void pesquisa() {
    if (_formKey.currentState!.validate()) {
      for (int i = 0; i < widget.camItems.length; i++) {
        if (selectController.text.toUpperCase() == widget.camItems[i].placa) {
          setState(() {
            select = widget.camItems[i];
          });
          return;
        }
      }
      showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Nenhum caminhão encontrado com a placa inserida',
              style: TextStyle(fontSize: 15),
            ),
          );
        },
      );
    }
  }
}
