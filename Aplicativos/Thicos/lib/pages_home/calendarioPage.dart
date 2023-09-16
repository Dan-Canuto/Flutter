import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(149, 122, 86, 1),
      child: const Center(
        child: Text(
          'Calendário',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
