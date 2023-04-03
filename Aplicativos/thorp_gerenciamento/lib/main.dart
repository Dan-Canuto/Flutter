import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thorp_gerenciamento/pages/financas_page.dart';
import 'package:thorp_gerenciamento/pages/new_page.dart';
import 'package:thorp_gerenciamento/pages/processos_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return SafeArea(
      child: Scaffold(
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
          title: const Text(
            "THORP",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _indexNavBar,
          children: const <Widget>[
            ProcessosPage(),
            FinancasPage(),
            NewPage(),
          ],
        ),
      ),
    );
  }
}
