import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _toDoController = TextEditingController();

  List _toDoList = [];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["title"] = _toDoController.text;
      _toDoController.clear();
      newToDo["ok"] = false;
      _toDoList.add(newToDo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(17, 1, 7, 1),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _toDoController,
                    decoration: const InputDecoration(
                        labelText: "Nova Tarefa",
                        labelStyle: TextStyle(color: Colors.blueAccent)),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addToDo,
                  // ignore: prefer_const_constructors
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: const Text("ADD"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: _toDoList.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(_toDoList[index]["title"]),
                  value: _toDoList[index]["ok"],
                  secondary: CircleAvatar(
                    child: Icon(
                        _toDoList[index]["ok"] ? Icons.check : Icons.error),
                  ),
                  onChanged: (c) {
                    setState(() {
                      _toDoList[index]["ok"] = c;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
