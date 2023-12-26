import 'package:accordion/accordion.dart';
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
              Accordion(
                headerBorderColor: Colors.blueGrey,
                headerBorderColorOpened: Colors.transparent,
                // headerBorderWidth: 1,
                headerBackgroundColorOpened: Colors.green,
                contentBackgroundColor: Colors.white,
                contentBorderColor: Colors.green,
                contentBorderWidth: 3,
                contentHorizontalPadding: 20,
                scaleWhenAnimating: true,
                openAndCloseAnimation: true,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                children: [
                  AccordionSection(
                    isOpen: true,
                    contentVerticalPadding: 20,
                    leftIcon:
                        const Icon(Icons.text_fields_rounded, color: Colors.white),
                    header: const Text('Freio'),
                    content: const Text('Teste'),
                  ),
                  AccordionSection(
                    isOpen: true,
                    contentVerticalPadding: 20,
                    leftIcon:
                        const Icon(Icons.text_fields_rounded, color: Colors.white),
                    header: const Text('Óleo de Motor'),
                    content: const Text('Teste'),
                  ),
                  AccordionSection(
                    isOpen: true,
                    contentVerticalPadding: 20,
                    leftIcon:
                        const Icon(Icons.text_fields_rounded, color: Colors.white),
                    header: const Text('Manutenção Mecânica'),
                    content: const Text('Teste'),
                  ),
                  AccordionSection(
                    isOpen: true,
                    contentVerticalPadding: 20,
                    leftIcon:
                        const Icon(Icons.text_fields_rounded, color: Colors.white),
                    header: const Text('Câmbiio'),
                    content: const Text('Teste'),
                  ),
                  AccordionSection(
                    isOpen: true,
                    contentVerticalPadding: 20,
                    leftIcon:
                        const Icon(Icons.text_fields_rounded, color: Colors.white),
                    header: const Text('Diferêncial'),
                    content: const Text('Teste'),
                  ),
                ],
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
