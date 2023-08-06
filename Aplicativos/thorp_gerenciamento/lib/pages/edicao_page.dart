import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../main.dart';

class EdicaoDadosPage extends StatefulWidget {
  EdicaoDadosPage({super.key});

  //
  @override
  State<EdicaoDadosPage> createState() => _EdicaoPageState();
}

class _EdicaoPageState extends State<EdicaoDadosPage> {
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
                  '/d',
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
                      "Edição do Processo",
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
      ),
    );
  }
}
