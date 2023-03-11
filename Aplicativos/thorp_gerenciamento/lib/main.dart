import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  var db = FirebaseFirestore.instance;
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
  int _indexNavBar = 0;
  @override
  Widget build(BuildContext context) {
    final iconList = <IconData>[
      Icons.list,
      Icons.monetization_on,
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indexNavBar,
        onTap: (value) => {
          setState(() {
            _indexNavBar = value;
          })
        },
        backgroundColor: Colors.black,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Processos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: "Financas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.summarize),
            label: "Novo processo",
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("THORP"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _indexNavBar,
        children: const <Widget>[
          Procesos(),
          Financas(),
          NewProcessos(),
        ],
      ),
    );
  }
}

class Procesos extends StatelessWidget {
  const Procesos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 20,
      color: Colors.grey,
    );
  }
}

class Financas extends StatelessWidget {
  const Financas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NewProcessos extends StatelessWidget {
  const NewProcessos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
