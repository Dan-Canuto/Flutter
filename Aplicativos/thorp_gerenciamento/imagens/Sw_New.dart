import 'package:flutter/material.dart';

class Swnew extends StatefulWidget {
  const Swnew({super.key});

  @override
  State<Swnew> createState() => _SwnewState();
}

class _SwnewState extends State<Swnew> {
  late String nome = "Alface";
  late int slot = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 141, 131, 131),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Nova Colheita",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(34, 139, 34, 1),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.only(),
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  child: Text("Alface"),
                                  value: "Alface",
                                ),
                                DropdownMenuItem(
                                  child: Text("Pimenta"),
                                  value: "Pimenta",
                                ),
                                DropdownMenuItem(
                                  child: Text("Cebolinha"),
                                  value: "Cebolinha",
                                ),
                                DropdownMenuItem(
                                  child: Text("Salsinha"),
                                  value: "Salsinha",
                                ),
                              ],
                              value: nome,
                              onChanged: (String? value) {
                                setState(() {
                                  nome = value!;
                                });
                              }),
                          Image.asset('imagens/alface.png'),
                          DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  child: Text("Slot 1"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Slot 2"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("Slot 3"),
                                  value: 3,
                                ),
                                DropdownMenuItem(
                                  child: Text("Slot 4"),
                                  value: 4,
                                ),
                                DropdownMenuItem(
                                  child: Text("Slot 5"),
                                  value: 5,
                                ),
                                DropdownMenuItem(
                                  child: Text("Slot 6"),
                                  value: 6,
                                ),
                              ],
                              value: slot,
                              onChanged: (int? value) {
                                setState(() {
                                  slot = value!;
                                });
                              }),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Enviar"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(34, 139, 34, 1),
                        ),
                      ),
                    )
                  ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: Color.fromRGBO(34, 139, 34, 1),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 141, 131, 131),
                    blurRadius: 4,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.08,
                    child: Material(
                      child: Ink(
                        height: 50,
                        width: 200,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/hub',
                            );
                          },
                          highlightColor: Colors.white,
                          child: Container(
                              alignment: Alignment.center,
                              child: Icon(Icons.calendar_month)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.08,
                    child: Material(
                      child: Ink(
                        height: 50,
                        width: 200,
                        child: InkWell(
                          onTap: () {},
                          highlightColor: Colors.white,
                          child: Container(
                              alignment: Alignment.center,
                              child: Icon(Icons.add)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.08,
                    child: Material(
                      child: Ink(
                        height: 50,
                        width: 200,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/edit',
                            );
                          },
                          highlightColor: Colors.white,
                          child: Container(
                              alignment: Alignment.center,
                              child: Icon(Icons.edit)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.08,
                    child: Material(
                      child: Ink(
                        height: 50,
                        width: 200,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/help',
                            );
                          },
                          highlightColor: Colors.white,
                          child: Container(
                              alignment: Alignment.center,
                              child: Icon(Icons.help)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        appBar: AppBar(
          title: const Text(
            'Horta de "login"',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/',
                );
              },
              color: Colors.white,
              icon: const Icon(Icons.logout),
            )
          ],
          centerTitle: true,
          backgroundColor: Color.fromRGBO(34, 139, 34, 1),
        ),
      ),
    );
  }
}
