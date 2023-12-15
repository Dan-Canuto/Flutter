import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MY\nCOMPANION',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(17, 217, 124, 0.7),
            ),),
            SizedBox(
              height: mediaQuery.size.height * 0.15,
            ),
            Container(
              padding: EdgeInsets.all(12),
              width: mediaQuery.size.width * 0.8,
              height: mediaQuery.size.height * 0.3,
              decoration: BoxDecoration(
                color: Color.fromRGBO(17, 217, 124, 0.7),
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 5,
                  color: Color.fromRGBO(13, 166, 95, 0.8),
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Text(
                    "SENHA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(4, 38, 22, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    color: Colors.white,
                    height: 30,
                    width: 400,
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: Color.fromRGBO(4, 38, 22, 1),
                    ),
                    child: Text("Enviar"))
                ],
              ),
            ),
          ],
        ),
      )

      
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}