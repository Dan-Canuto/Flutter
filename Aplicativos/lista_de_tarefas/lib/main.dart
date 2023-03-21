import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/repositories/todo_repository.dart';

import 'models/todo.dart';

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
  final TodoRepository todoRepository = TodoRepository();

  List _toDoList = [];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  void _addToDo() {
    String text = _toDoController.text;
    setState(() {
      Todo newTodo = Todo(title: text, ok: false);
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
