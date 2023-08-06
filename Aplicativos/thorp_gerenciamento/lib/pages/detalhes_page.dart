import 'dart:io';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:intl/intl.dart';

import 'package:thorp_gerenciamento/main.dart';
import 'package:pdf/pdf.dart' as pdfLib1;
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:path_provider/path_provider.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';

import '../models/processos.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({
    super.key,
  });
  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  String? senha;
  late String statusText;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController senhaController = TextEditingController();
  final TextEditingController cotacaoController = TextEditingController();
  _confereStatus() {
    switch (proc?.status) {
      case "1":
        return "Booking";
      case "2":
        return "Navegando";
      case "3":
        return "Atracado/Armazenagem";
      case "4":
        return "Finalizado";
      default:
        statusText = "Status desconhecido";
    }
  }

  _createPdf(BuildContext context) async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    pdf.addPage(
      pdfLib.MultiPage(
        build: (context) => [
          pdfLib.Center(
            child: pdfLib.Text('THORP',
                style: const pdfLib.TextStyle(
                  fontSize: 30,
                  color: pdfLib1.PdfColors.blueAccent,
                )),
          ),
          pdfLib.Center(
            child: pdfLib.Text('Cargo e Serviços',
                style: const pdfLib.TextStyle(
                  fontSize: 20,
                )),
          ),
          pdfLib.Container(margin: const pdfLib.EdgeInsets.only(top: 120)),
          pdfLib.Center(
            child: pdfLib.Text('Informações da sua carga',
                style: const pdfLib.TextStyle(
                  fontSize: 20,
                )),
          ),
          pdfLib.Container(margin: const pdfLib.EdgeInsets.only(top: 20)),
          pdfLib.TableHelper.fromTextArray(
            cellAlignment: pdfLib.Alignment.center,
            data: <List<String>>[
              <String>[
                'Agente',
                proc!.agente,
              ],
              [
                'Nº de Referência',
                proc!.referencia,
              ],
              [
                'Empresa',
                proc!.empresa,
              ],
              [
                'Data de Embarque',
                DateFormat("dd/MM/yyyy").format(proc!.dataEmbarque.toDate()),
              ],
              [
                'Previsao de chegada',
                DateFormat("dd/MM/yyyy").format(proc!.dataPrevChegada.toDate()),
              ],
              [
                'Status Chegada',
                _confereStatus(),
              ],
              [
                'Data de Chegada',
                proc?.dataChegada != null
                    ? DateFormat('dd/MM/yyyy')
                        .format(proc!.dataChegada!.toDate())
                    : 'Não Cadastrada',
              ],
              [
                'Detalhes do Embarque,',
                proc!.infoEmbarque,
              ],
              [
                'Porto de Origem',
                proc!.portoOrigem,
              ],
              [
                'Porto de Chegada',
                proc!.portoChegada,
              ]
            ],
          ),
          pdfLib.Container(margin: const pdfLib.EdgeInsets.only(top: 200)),
          pdfLib.Center(
            child: pdfLib.Text('Cesar Pereira',
                style: const pdfLib.TextStyle(
                  fontSize: 16,
                )),
          ),
          pdfLib.Center(
            child: pdfLib.Text('(11) 98149-0706',
                style: const pdfLib.TextStyle(
                  fontSize: 16,
                )),
          ),
          pdfLib.Center(
            child: pdfLib.Text('Cesar@thorpcargo.com.br',
                style: const pdfLib.TextStyle(
                  fontSize: 16,
                )),
          ),
        ],
      ),
    );
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/' + proc!.referencia;
    final File file = File(path);

    final Uint8List pdfBytes = await pdf.save();
    await file.writeAsBytes(pdfBytes);

    await Share.file(
      'Compartilhar PDF',
      '${proc!.referencia}.pdf',
      pdfBytes,
      'application/pdf',
      text: 'Confira este PDF!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
          backgroundColor: const Color.fromRGBO(46, 49, 75, 1),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
          child: Column(
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
              CarouselSlider(
                items: [
                  Column(
                    children: [
                      Expanded(
                        flex: 20,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
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
                                color: const Color.fromRGBO(46, 49, 75, 1),
                                width: 8),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FractionallySizedBox(
                                      widthFactor: 1,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(46, 49, 75, 1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Identificação do Processo",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 25,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Text(
                                                'Agente:',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              proc?.agente != null
                                                  ? proc!.agente
                                                  : "Não inserido",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Text(
                                                'Empresa: ',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              proc?.empresa != null
                                                  ? proc!.empresa
                                                  : "Não inserido",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Text(
                                                'Nº de ref:',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              proc?.referencia != null
                                                  ? proc!.referencia
                                                  : "Não inserido",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Text(
                                                'Status do Pedido',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              _confereStatus(),
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 1,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Datas do Processo",
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        46, 49, 75, 1),
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Data de embarque: ',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              proc?.dataEmbarque != null
                                                  ? DateFormat('dd/MM/yyyy')
                                                      .format(proc!.dataEmbarque
                                                          .toDate())
                                                  : 'Não Cadastrada',
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Previsao de chegada: ',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              proc?.dataPrevChegada != null
                                                  ? DateFormat('dd/MM/yyyy')
                                                      .format(proc!
                                                          .dataPrevChegada
                                                          .toDate())
                                                  : 'Não Cadastrada',
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Data de chegada: ',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              proc?.dataChegada != null
                                                  ? DateFormat('dd/MM/yyyy')
                                                      .format(proc!.dataChegada!
                                                          .toDate())
                                                  : 'Não Cadastrada',
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 1,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(46, 49, 75, 1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Informações do Embarque",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Detalhes: ',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              proc?.infoEmbarque != null
                                                  ? proc!
                                                      .infoEmbarque //Alteração de quebra de linha
                                                  : "Não inserido",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Porto de origem: ',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              proc?.portoOrigem != null
                                                  ? proc!.portoOrigem
                                                  : "Não informado",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Porto de chegada: ',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              proc?.portoChegada != null
                                                  ? proc!.portoChegada
                                                  : "Não informado",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
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
                          color: const Color.fromRGBO(46, 49, 75, 1), width: 8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Visibility(
                      visible: senha == "12345678",
                      replacement: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  "Financeiro do Processo",
                                  style: TextStyle(
                                    color: Color.fromRGBO(46, 49, 75, 1),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty || value != "12345678") {
                                      return 'Senha incorreta';
                                    }
                                  },
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  controller: senhaController,
                                  decoration: const InputDecoration(
                                    labelText: "Senha",
                                    labelStyle: TextStyle(
                                      color: Color.fromRGBO(46, 49, 75, 1),
                                    ),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(46, 49, 75, 1),
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "0";
                                          });
                                        },
                                        child: const Text(
                                          "0",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "1";
                                          });
                                        },
                                        child: const Text(
                                          "1",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "2";
                                          });
                                        },
                                        child: const Text(
                                          "2",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "3";
                                          });
                                        },
                                        child: const Text(
                                          "3",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "4";
                                          });
                                        },
                                        child: const Text(
                                          "4",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "5";
                                          });
                                        },
                                        child: const Text(
                                          "5",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "6";
                                          });
                                        },
                                        child: const Text(
                                          "6",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "7";
                                          });
                                        },
                                        child: const Text(
                                          "7",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "8";
                                          });
                                        },
                                        child: const Text(
                                          "8",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    46, 49, 75, 1),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            minimumSize: const Size(50, 40)),
                                        onPressed: () {
                                          setState(() {
                                            senhaController.text += "9";
                                          });
                                        },
                                        child: const Text(
                                          "9",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color.fromRGBO(46, 49, 75, 1),
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        minimumSize: const Size(100, 50)),
                                    onPressed: () {
                                      senhaController.clear();
                                    },
                                    child: const Column(children: [
                                      Text("Limpar"),
                                    ]),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color.fromRGBO(46, 49, 75, 1),
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        minimumSize: const Size(100, 50)),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        senha = senhaController.text;

                                        setState(() {
                                          senha = "12345678";
                                          _formKey = GlobalKey<FormState>();
                                        });
                                      } else {
                                        senhaController.clear();
                                      }
                                    },
                                    child: const Column(children: [
                                      Text("Enviar"),
                                    ]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "Financeiro do Processo",
                                style: TextStyle(
                                  color: Color.fromRGBO(46, 49, 75, 1),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                ),
                              ),
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FractionallySizedBox(
                                          widthFactor: 1,
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              color:
                                                  Color.fromRGBO(46, 49, 75, 1),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Status do Pagamento  ',
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      color:
                                                          proc!.statusPagamento ==
                                                                  true
                                                              ? Colors.green
                                                              : Colors.red,
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text(
                                                    'Cotação do Dolar:',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  proc?.cotacaoDolar != "1"
                                                      ? "R\$ ${double.parse(proc!.cotacaoDolar!).toStringAsFixed(2)}"
                                                      : "Não inserido",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text(
                                                    'Comissão da Armazenagem:',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      proc?.comissArmazenagem !=
                                                              null
                                                          ? "R\$ ${double.parse(proc!.comissArmazenagem).toStringAsFixed(2)}"
                                                          : "Não inserido",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      proc?.comissArmazenagem !=
                                                                  null &&
                                                              proc?.cotacaoDolar !=
                                                                  "1"
                                                          ? "U\$D ${(double.parse(proc!.comissArmazenagem) / double.parse(proc!.cotacaoDolar!)).toStringAsFixed(2)}"
                                                          : "Sem cotação",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text(
                                                    'Taxa de Destino:',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      proc?.comissDestino !=
                                                              null
                                                          ? "U\$D ${double.parse(proc!.comissDestino).toStringAsFixed(2)}"
                                                          : "Não inserido",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      proc?.comissDestino !=
                                                                  null &&
                                                              proc?.cotacaoDolar !=
                                                                  "1"
                                                          ? "R\$ ${(double.parse(proc!.comissDestino) * double.parse(proc!.cotacaoDolar!)).toStringAsFixed(2)}"
                                                          : "Sem cotação",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text(
                                                    'Comissão do frete (Compra):',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      proc?.comissFreteCompra !=
                                                              null
                                                          ? "U\$D ${double.parse(proc!.comissFreteCompra).toStringAsFixed(2)}"
                                                          : "Não inserido",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      proc?.comissFreteCompra !=
                                                                  null &&
                                                              proc?.cotacaoDolar !=
                                                                  "1"
                                                          ? "R\$ ${(double.parse(proc!.comissFreteCompra) * double.parse(proc!.cotacaoDolar!)).toStringAsFixed(2)}"
                                                          : "Sem cotação",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text(
                                                    'Comissão do frete (Venda):',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      proc?.comissFreteVenda !=
                                                              null
                                                          ? "U\$D ${double.parse(proc!.comissFreteVenda).toStringAsFixed(2)}"
                                                          : "Não inserido",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      proc?.comissFreteVenda !=
                                                                  null &&
                                                              proc?.cotacaoDolar !=
                                                                  "1"
                                                          ? "R\$ ${(double.parse(proc!.comissFreteVenda) * double.parse(proc!.cotacaoDolar!)).toStringAsFixed(2)}"
                                                          : "Sem cotação",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text(
                                                    'Comissão do frete (Lucro):',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      proc?.comissFreteCompra !=
                                                                  null &&
                                                              proc?.comissFreteVenda !=
                                                                  null
                                                          ? "U\$D ${(double.parse(proc!.comissFreteVenda) - double.parse(proc!.comissFreteCompra)).toStringAsFixed(2)}"
                                                          : "Não inserido",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      proc?.comissFreteCompra !=
                                                                  null &&
                                                              proc?.cotacaoDolar !=
                                                                  "1"
                                                          ? "R\$ ${((double.parse(proc!.comissFreteVenda) - double.parse(proc!.comissFreteCompra)) * double.parse(proc!.cotacaoDolar!)).toStringAsFixed(2)}"
                                                          : "Sem cotação",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 550,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 16 / 5,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 141, 131, 131),
                            blurRadius: 9,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(46, 49, 75, 1),
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          minimumSize: const Size(160, 80),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/e',
                          );
                        },
                        child: const Column(children: [
                          Icon(Icons.edit),
                          Text("Editar"),
                        ]),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 141, 131, 131),
                            blurRadius: 9,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(46, 49, 75, 1),
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            minimumSize: const Size(160, 80)),
                        onPressed: () {
                          _createPdf(context);
                        },
                        child: const Column(children: [
                          Icon(Icons.share),
                          Text("Compartilhar"),
                        ]),
                      ),
                    ),
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
