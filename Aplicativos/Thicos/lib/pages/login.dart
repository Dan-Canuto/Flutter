import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thicos/models/caminhoes.dart';
import 'package:thicos/models/manutencao.dart';
import 'package:thicos/models/perfis.dart';
import 'package:thicos/pages/home.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Perfil> perfItems = [];
  List<Caminhao> camItems = [];
  List<Manutencao> manuItems = [];
  @override
  void initState() {
    fetchRecords('Perfil');
    FirebaseFirestore.instance.collection('Perfil').snapshots().listen(
      (records) {
        mapRecords(records, 'Perfil');
      },
    );
    fetchRecords('Manutencao');
    FirebaseFirestore.instance.collection('Manutencao').snapshots().listen(
      (records) {
        mapRecords(records, 'Manutencao');
      },
    );
    fetchRecords('Caminhao');
    FirebaseFirestore.instance.collection('Caminhao').snapshots().listen(
      (records) {
        mapRecords(records, 'Caminhao');
      },
    );

    super.initState();
  }

  fetchRecords(String colection) async {
    var records = await FirebaseFirestore.instance.collection(colection).get();
    mapRecords(records, colection);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records, String colection) {
    switch (colection) {
      case 'Caminhao':
        var list = records.docs
            .map(
              (cami) => Caminhao(
                cami['modelo'],
                cami['placa'],
                cami['status'],
                cami['foto'],
              ),
            )
            .toList();
        if (this.mounted) {
          setState(() {
            // TODO: implement setState
            camItems = list;
          });
        }
        break;
      case 'Manutencao':
        var list = records.docs
            .map(
              (manu) => Manutencao(
                manu['ativo'],
                manu['caminhao'],
                manu['dataRealizacao'],
                manu['dataVencimento'],
                manu['mecanico'],
                manu['notaFiscal'],
                manu['observacao'],
                manu['valor'],
              ),
            )
            .toList();
        if (this.mounted) {
          setState(() {
            // TODO: implement setState
            manuItems = list;
          });
        }
        break;
      case 'Perfil':
        var list = records.docs
            .map(
              (perf) => Perfil(
                perf['nome'],
                perf['login'],
                perf['senha'],
                perf['permissao'],
              ),
            )
            .toList();
        if (this.mounted) {
          setState(() {
            perfItems = list;
          });
        }
        break;
    }
  }

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(149, 122, 86, 1),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(8),
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 228, 225, 228),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                  offset: Offset(
                    0,
                    4,
                  ),
                ),
              ],
              border: Border.all(
                color: Color.fromRGBO(5, 33, 58, 1),
                width: 4,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Color.fromRGBO(5, 33, 58, 1),
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(5, 33, 58, 1), width: 2),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.jpeg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                    child: TextFormField(
                      controller: loginController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o valor';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Login",
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(46, 49, 75, 1),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(5, 33, 58, 1),
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 0, 24, 8),
                    child: TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: senhaController,
                      onFieldSubmitted: (value) {
                        login();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o valor';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(5, 33, 58, 1),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(5, 33, 58, 1),
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(5, 33, 58, 1)),
                    child: Text(
                      'ENTRAR',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      String senhaVal = senhaController.text;
      String loginVal = loginController.text;
      for (int i = 0; i < perfItems.length; i++) {
        if (senhaVal == perfItems[i].senha && loginVal == perfItems[i].login) {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(
                  perfil: perfItems[i],
                  camItems: camItems,
                  manuItems: manuItems,
                ),
              ),
            );
          });
          break;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nenhum perfil encontrado!')),
          );
        }
      }
    }
  }
}
