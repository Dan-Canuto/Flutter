import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/processos.dart';

class DetalhesPage extends StatefulWidget {
  DetalhesPage({super.key, required this.processo});
  Processo processo;
  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
