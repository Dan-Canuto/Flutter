import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';
import 'package:organizer/firebase_options.dart';
import 'package:organizer/pages/home_page.dart';
import 'package:organizer/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      home: const Home(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => const Home(),
        '/Login': (BuildContext context) => const LoginPage(),
        '/HomePage': (BuildContext context) => const HomePage(),
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
        backgroundColor: AppColors.black,
        body: LoginPage(),
      ),
    );
  }
}
