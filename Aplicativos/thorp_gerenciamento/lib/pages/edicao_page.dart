import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../main.dart';

class EdicaoDadosPage extends StatefulWidget {
  EdicaoDadosPage({super.key});

  final TextEditingController RefController =
      TextEditingController(text: proc!.referencia);
  final TextEditingController AgtController =
      TextEditingController(text: proc!.agente);
  final TextEditingController EmpController =
      TextEditingController(text: proc!.empresa);
  final TextEditingController InfoEmbarqueController =
      TextEditingController(text: proc!.infoEmbarque);
  final TextEditingController PortoOrigemController =
      TextEditingController(text: proc!.portoOrigem);
  final TextEditingController PortoChegadaController =
      TextEditingController(text: proc!.portoChegada);
  bool? statusConcluido = proc?.statusConcluido;
  bool? statusChegada = proc?.statusChegada;
  @override
  State<EdicaoDadosPage> createState() => _EdicaoPageState();
}

class _EdicaoPageState extends State<EdicaoDadosPage> {
  @override
  void initState() {}

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
