import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thicos/models/caminhoes.dart';
import 'package:thicos/widget/caminhoesItems.dart';

class CaminhoesPage extends StatefulWidget {
  CaminhoesPage(
      {super.key, required this.camItems, required this.encaminhamento});

  final List<Caminhao> camItems;
  final Function encaminhamento;
  @override
  State<CaminhoesPage> createState() => _CaminhoesPageState();
}

class _CaminhoesPageState extends State<CaminhoesPage> {
  @override
  final TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(149, 122, 86, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                ),
              ],
            ),
            child: Text(
              'CAMINHÕES',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 3,
                              color: Color.fromRGBO(46, 49, 75, 1),
                            ),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            onFieldSubmitted: (value) {
                              pesquisa();
                            },
                            cursorColor: Color.fromRGBO(46, 49, 75, 1),
                            controller: searchController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe o valor';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusColor: Color.fromRGBO(46, 49, 75, 1),
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(46, 49, 75, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: RawMaterialButton(
                          onPressed: () {
                            pesquisa();
                          },
                          elevation: 20.0,
                          fillColor: Color.fromRGBO(46, 49, 75, 1),
                          focusColor: Color.fromRGBO(46, 49, 75, 0.7),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.7,
            child: GridView.count(
              crossAxisCount: 5,
              scrollDirection: Axis.vertical,
              children: List.generate(
                widget.camItems.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      widget.encaminhamento(
                        widget.camItems[index],
                      );
                    },
                    child: CaminhoesItems(
                      caminhao: widget.camItems[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pesquisa() {
    if (_formKey.currentState!.validate()) {
      for (int i = 0; i < widget.camItems.length; i++) {
        if (searchController.text.toUpperCase() == widget.camItems[i].placa) {
          widget.encaminhamento(widget.camItems[i]);
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
