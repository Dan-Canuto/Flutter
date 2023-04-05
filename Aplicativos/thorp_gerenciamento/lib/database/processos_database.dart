import 'dart:convert';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thorp_gerenciamento/models/processos.dart';

class ProcDatabase {
  var db = FirebaseFirestore.instance;
  void saveProc(Processos proc) {
    final Map<String,String> jsonString = json.encode(proc) ;
    db.collection("processos").add(jsonString).then((DocumentReference doc))
  }
}
