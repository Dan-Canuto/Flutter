import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thicos/models/caminhoes.dart';
import 'package:thicos/models/manutencao.dart';
import 'package:thicos/widget/contentManutencao.dart';
import 'package:thicos/widget/expandedMenuItems.dart';

class ManutencaoList extends StatefulWidget {
  const ManutencaoList(
      {super.key, required this.caminhao});

  final Caminhao caminhao;
  @override
  State<ManutencaoList> createState() => _manutencaoListState();
}

class _manutencaoListState extends State<ManutencaoList> {
  @override
  
  Widget build(BuildContext context) {
    final mediaQuery =MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 0.55,
      padding: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.025),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: mediaQuery.size.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 20,
                color: Colors.white,
                child: Container(
                  height: mediaQuery.size.height * 0.45,
                  width: mediaQuery.size.width * 0.25,
                  child: ContentManutencao(name: 'Freios', caminhao: widget.caminhao, title: 'Freios',),
                ),
              ),
              Card(
                elevation: 20,
                color: Colors.white,
                child: Container(
                  height: mediaQuery.size.height * 0.45,
                  width: mediaQuery.size.width * 0.25,
                  child: ContentManutencao(name: 'ManutencaoMecanica', caminhao: widget.caminhao, title: 'Manutenção Mecânica',),
                ),
              ),
              Card(
                elevation: 20,
                color: Colors.white,
                child: Container(
                  height: mediaQuery.size.height * 0.45,
                  width: mediaQuery.size.width * 0.25,
                  child: ContentManutencao(name: 'Diferencial', caminhao: widget.caminhao, title: 'Diferêncial',),
                ),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 20,
                color: Colors.white,
                child: Container(
                  height: mediaQuery.size.height * 0.45,
                  width: mediaQuery.size.width * 0.25,
                  child: ContentManutencao(name: 'oleoDoMotor', caminhao: widget.caminhao, title: 'Óleo do motor',),
                ),
              ),
               Card(
                elevation: 20,
                color: Colors.white,
                child: Container(
                  height: mediaQuery.size.height * 0.45,
                  width: mediaQuery.size.width * 0.25,
                  child: ContentManutencao(name: 'Cambio', caminhao: widget.caminhao, title: 'Câmbio',),
                ),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.005,
          ),
        ],
      ),
    );
  }

  // Manutencao? selectComponente(String componente) {
  //   for (int i = 0; i < widget.manuItems.length; i++) {
  //     if (widget.manuItems[i].ativo == true &&
  //         widget.manuItems[i].componente == componente) {
  //       return widget.manuItems[i];
  //     }
  //   }
  //   return null;
  // }
}
