import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thicos/models/perfis.dart';
import 'package:thicos/pages/home.dart';
import 'package:thicos/pages/login.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thicos',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-support  ed IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(5, 33, 58, 1)),
        useMaterial3: true,
      ),
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => MyHomePage(
              perfil: Perfil("Danilo", "Danilo", "123", "Dev"),
              camItems: [],
              manuItems: [],
            ),
        '/login': (BuildContext context) => Login(),
      },
    );
  }
}
