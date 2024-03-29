import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thorp_gerenciamento/models/processos.dart';
import 'package:thorp_gerenciamento/pages/detalhes_page.dart';
import 'package:thorp_gerenciamento/pages/edicao_page.dart';
import 'package:thorp_gerenciamento/pages/financas_page.dart';
import 'package:thorp_gerenciamento/pages/new_page.dart';
import 'package:thorp_gerenciamento/pages/processos_page.dart';

import 'firebase_options.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
Processo? proc;
int indexNavBar = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      home: const Home(),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => const Home(),
        '/d': (BuildContext context) => const DetalhesPage(),
        '/e': (BuildContext context) => EdicaoDadosPage(),
      },
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final iconList = <IconData>[
      Icons.list,
      Icons.monetization_on,
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: indexNavBar,
          onTap: (value) => {
            setState(
              () {
                indexNavBar = value;
              },
            )
          },
          backgroundColor: Color.fromRGBO(46, 49, 75, 1),
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
          title: const Text(
            "THORP",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Color.fromRGBO(46, 49, 75, 1),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: indexNavBar,
          children: const <Widget>[
            ProcessosPage(),
            FinancasPage(),
            NewPage(),
            DetalhesPage(),
          ],
        ),
      ),
    );
  }
}
