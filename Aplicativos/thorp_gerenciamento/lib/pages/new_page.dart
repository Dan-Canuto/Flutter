import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final TextEditingController ProcController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            child: Text(
              "Novo Processo",
              style: TextStyle(fontSize: 50),
              selectionColor: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: ProcController,
              decoration: InputDecoration(
                labelText: "Número de referência",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 5,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: ProcController,
              decoration: InputDecoration(
                labelText: "Agente",
                labelStyle: TextStyle(
                  color: Colors.amber,
                ),
                border: OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                    width: 5,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: ProcController,
              decoration: InputDecoration(
                labelText: "Número de referência",
                labelStyle: TextStyle(
                  color: Colors.amber,
                ),
                border: OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                    width: 5,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: ProcController,
              decoration: InputDecoration(
                labelText: "Número de referência",
                labelStyle: TextStyle(
                  color: Colors.amber,
                ),
                border: OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                    width: 5,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: ProcController,
              decoration: InputDecoration(
                labelText: "Número de referência",
                labelStyle: TextStyle(
                  color: Colors.amber,
                ),
                border: OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                    width: 5,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
