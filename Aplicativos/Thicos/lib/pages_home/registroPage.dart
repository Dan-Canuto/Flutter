import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(149, 122, 86, 1),
      child: const Center(
        child: Text(
          'Registro',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
