import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thicos/models/caminhoes.dart';
import 'package:thicos/models/manutencao.dart';
import 'package:thicos/widget/expandedMenuItems.dart';

class manutencaoList extends StatefulWidget {
  const manutencaoList(
      {super.key, required this.caminhao, required this.manuItems});

  final Caminhao caminhao;
  final List<Manutencao> manuItems;
  @override
  State<manutencaoList> createState() => _manutencaoListState();
}

class _manutencaoListState extends State<manutencaoList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.375,
          child: ListView(
            shrinkWrap: true,
            children: [
              ExpansionTileCard(
                baseColor: Color.fromRGBO(46, 49, 75, 1),
                expandedColor: Color.fromRGBO(46, 49, 75, 1),
                expandedTextColor: Colors.white,
                title: Row(
                  children: [
                    Icon(
                      Icons.looks_one,
                      color: Colors.white,
                    ),
                    Text(
                      "Freios",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                children: [
                  ExpandedMenuItems(detalhes: selectComponente("Freio"))
                ],
              ),
              ExpansionTileCard(
                baseColor: Color.fromRGBO(46, 49, 75, 1),
                expandedColor: Color.fromRGBO(46, 49, 75, 1),
                expandedTextColor: Colors.white,
                title: Row(
                  children: [
                    Icon(
                      Icons.looks_3,
                      color: Colors.white,
                    ),
                    Text(
                      "Óleo do motor",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionTileCard(
                baseColor: Color.fromRGBO(46, 49, 75, 1),
                expandedColor: Color.fromRGBO(46, 49, 75, 1),
                expandedTextColor: Colors.white,
                title: Row(
                  children: [
                    Icon(
                      Icons.looks_5,
                      color: Colors.white,
                    ),
                    Text(
                      "Manutenção Mecânica",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.375,
          child: ListView(
            shrinkWrap: true,
            children: [
              ExpansionTileCard(
                baseColor: Color.fromRGBO(46, 49, 75, 1),
                expandedColor: Color.fromRGBO(46, 49, 75, 1),
                expandedTextColor: Colors.white,
                title: Row(
                  children: [
                    Icon(
                      Icons.looks_two,
                      color: Colors.white,
                    ),
                    Text(
                      "Câmbio",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionTileCard(
                baseColor: Color.fromRGBO(46, 49, 75, 1),
                expandedColor: Color.fromRGBO(46, 49, 75, 1),
                expandedTextColor: Colors.white,
                title: Row(
                  children: [
                    Icon(
                      Icons.looks_4,
                      color: Colors.white,
                    ),
                    Text(
                      "Diferencial",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Manutencao? selectComponente(String componente) {
    for (int i = 0; i < widget.manuItems.length; i++) {
      if (widget.manuItems[i].ativo == true &&
          widget.manuItems[i].componente == componente) {
        return widget.manuItems[i];
      }
    }
    return null;
  }
}
