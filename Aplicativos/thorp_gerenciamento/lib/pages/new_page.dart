import 'dart:math';

import 'package:thorp_gerenciamento/main.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:thorp_gerenciamento/models/processos.dart';
import 'package:uuid/uuid.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _dtEmbarque;
  Timestamp? _dtimeEmbarque;

  String? _dtPrevChegada;
  Timestamp? _dtimePrevChegada;

  String? _dtPrevPagamento;
  Timestamp? _dtimePrevPagamento;

  final TextEditingController RefController = TextEditingController();
  final TextEditingController AgtController = TextEditingController();
  final TextEditingController EmpController = TextEditingController();
  final TextEditingController VlrPrevistoController = TextEditingController();
  final TextEditingController DtPrevPagamentoController =
      TextEditingController();
  final TextEditingController InfoEmbarqueController = TextEditingController();

  void _resetFields() {
    RefController.clear();
    AgtController.clear();
    EmpController.clear();
    VlrPrevistoController.clear();
    InfoEmbarqueController.clear();
    setState(() {
      _dtEmbarque = null;
      _dtPrevChegada = null;
      _dtPrevPagamento = null;
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                          color: Colors.black,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.indigo,
                    ),
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Novo Processo",
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
          Expanded(
            flex: 5,
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o valor';
                        }
                      },
                      keyboardType: TextInputType.text,
                      controller: RefController,
                      decoration: const InputDecoration(
                        labelText: "Número de referência",
                        labelStyle: TextStyle(
                          color: Colors.indigo,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigo,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: AgtController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o valor';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: "Agente",
                        labelStyle: TextStyle(
                          color: Colors.indigo,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigo,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o valor';
                        }
                      },
                      controller: EmpController,
                      decoration: const InputDecoration(
                        labelText: "Nome da empresa",
                        labelStyle: TextStyle(
                          color: Colors.indigo,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigo,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o valor';
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: VlrPrevistoController,
                      decoration: const InputDecoration(
                        labelText: "Comissão Prevista",
                        prefixText: "R\$ ",
                        labelStyle: TextStyle(
                          color: Colors.indigo,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigo,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: InfoEmbarqueController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o valor';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: "Informação do Embarque",
                        labelStyle: TextStyle(
                          color: Colors.indigo,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigo,
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                    padding: const EdgeInsets.all(10),
                    height: 120,
                    decoration: const BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ]),
                    child: Column(
                      children: [
                        const Text(
                          "\nEmbarque\n",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.green,
                          ),
                          onPressed: () async {
                            final value = await showCalendarDatePicker2Dialog(
                              config:
                                  CalendarDatePicker2WithActionButtonsConfig(),
                              value: [
                                _dtEmbarque == null
                                    ? DateTime.now()
                                    : _dtimeEmbarque!.toDate()
                              ],
                              context: context,
                              dialogSize: const Size(325, 400),
                            );
                            if (value != null) {
                              setState(() {
                                _dtEmbarque =
                                    DateFormat('dd/MM/yyyy').format(value[0]!);

                                _dtimeEmbarque = Timestamp.fromDate(value[0]!);
                              });
                            }
                          },
                          child: Text(
                            _dtEmbarque == null
                                ? "Insira uma data"
                                : _dtEmbarque!,
                            style: const TextStyle(
                              color: Colors.indigo,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                    padding: const EdgeInsets.all(10),
                    height: 120,
                    decoration: const BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ]),
                    child: Column(
                      children: [
                        const Text(
                          "\nPrev. de Chegada\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.green,
                          ),
                          onPressed: () async {
                            final value = await showCalendarDatePicker2Dialog(
                              config:
                                  CalendarDatePicker2WithActionButtonsConfig(),
                              value: [
                                _dtPrevChegada == null
                                    ? DateTime.now()
                                    : _dtimePrevChegada!.toDate()
                              ],
                              context: context,
                              dialogSize: const Size(325, 400),
                            );
                            if (value != null) {
                              setState(() {
                                _dtPrevChegada =
                                    DateFormat('dd/MM/yyyy').format(value[0]!);

                                _dtimePrevChegada =
                                    Timestamp.fromDate(value[0]!);
                              });
                            }
                          },
                          child: Text(
                            _dtPrevChegada == null
                                ? "Insira uma data"
                                : _dtPrevChegada!,
                            style: const TextStyle(
                              color: Colors.indigo,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                    padding: const EdgeInsets.all(10),
                    height: 120,
                    decoration: const BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ]),
                    child: Column(
                      children: [
                        const Text(
                          "\nPrev. de Pagamento\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.green,
                          ),
                          onPressed: () async {
                            final value = await showCalendarDatePicker2Dialog(
                              config:
                                  CalendarDatePicker2WithActionButtonsConfig(),
                              value: [
                                _dtPrevPagamento == null
                                    ? DateTime.now()
                                    : _dtimePrevPagamento!.toDate()
                              ],
                              context: context,
                              dialogSize: const Size(325, 400),
                            );
                            if (value != null) {
                              setState(() {
                                _dtPrevPagamento =
                                    DateFormat('dd/MM/yyyy').format(value[0]!);

                                _dtimePrevPagamento =
                                    Timestamp.fromDate(value[0]!);
                              });
                            }
                          },
                          child: Text(
                            _dtPrevPagamento == null
                                ? "Insira uma data"
                                : _dtPrevPagamento!,
                            style: const TextStyle(
                              color: Colors.indigo,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Material(
              child: Ink(
                height: 50,
                width: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.indigo,
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  onTap: enviarProc,
                  highlightColor: Colors.white,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Salvar",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveProc(Processo proc) {
    final id = Uuid().v1();
    var proce = <String, dynamic>{
      'referencia': proc.referencia,
      'agente': proc.agente,
      'empresa': proc.empresa,
      'dataEmbarque': proc.dataEmbarque,
      'dataPrevChegada': proc.dataPrevChegada,
      'dataChegada': proc.dataChegada,
      'dataPagamento': proc.dataPagamento,
      'statusChegada': proc.statusChegada,
      'statusPagamento': proc.statusPagamento,
      'infoEmbarque': proc.infoEmbarque,
      'valorPrevisto': proc.valorPrevisto,
      'dataPrevPagamento': proc.dataPrevPagamento
    };
    db.collection("Processos").doc(id).set(proce);
  }

  void enviarProc() {
    bool validatorEmbarque = _dtEmbarque == null ? false : true;
    bool validatorChegada = _dtPrevChegada == null ? false : true;
    bool validatorPagamento = _dtPrevPagamento == null ? false : true;
    if (_formKey.currentState!.validate() &&
        validatorPagamento &&
        validatorEmbarque &&
        validatorChegada) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Novo processo criado!!')),
      );

      String referencia = RefController.text;
      String agente = AgtController.text;
      String empresa = EmpController.text;
      String comiss = VlrPrevistoController.text;
      String infoEmbarque = InfoEmbarqueController.text;
      String dtEmbarque = _dtEmbarque!;
      String dtPrevChegada = _dtPrevChegada!;
      String dtPrevPagamento = _dtPrevPagamento!;

      Processo newProc = Processo(
          referencia,
          agente,
          empresa,
          _dtimeEmbarque!,
          _dtimePrevChegada!,
          comiss,
          _dtimePrevPagamento!,
          null,
          null,
          infoEmbarque);

      saveProc(newProc);

      setState(() {
        RefController.clear();
        AgtController.clear();
        EmpController.clear();
        VlrPrevistoController.clear();
        InfoEmbarqueController.clear();
        _dtEmbarque = null;
        _dtPrevChegada = null;
        _dtPrevPagamento = null;
      });

      print(
          "$referencia \n $agente \n $empresa \n $comiss \n $infoEmbarque \n $dtEmbarque \n $dtPrevChegada \n $dtPrevPagamento");
    } else {
      String? text =
          !validatorPagamento ? "Data de Pagamento não selecionada" : "";
      String? text1 =
          !validatorChegada ? "\nData de Chegada não selecionada" : "";
      String? text2 =
          !validatorEmbarque ? "\nData de Embarque não selecionada" : "";

      if (!validatorPagamento || !validatorChegada || !validatorEmbarque) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$text$text1$text2')));
      }
    }
  }
}
