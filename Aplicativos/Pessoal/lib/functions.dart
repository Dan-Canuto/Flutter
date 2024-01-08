import 'package:flutter/material.dart';
import 'package:organizer/widgets/showCards/showGoals.dart';
import 'package:organizer/widgets/showCards/showGym.dart';
import 'package:organizer/widgets/showCards/showNotes.dart';
import 'package:organizer/widgets/showCards/showReceipts.dart';
import 'package:organizer/widgets/showCards/showStudy.dart';
import 'package:organizer/widgets/showCards/showWork.dart';

List<dynamic>? SelectContentCards(String cardName){
  String? name ;
  IconData? icon;
  Widget? showCard;
  String? link;
  List<dynamic> select;

  switch (cardName){
    case "Academia" :
      name = 'Academia';
      icon = Icons.sports_gymnastics;
      showCard = ShowGym();
      link = '/Gym';
      break;
    case "Trabalho":
      name = "Trabalho";
      icon = Icons.work;
      showCard = ShowWork();
      link = '/Work';
      break;
    case "Meta":
      name = "Metas";
      icon = Icons.track_changes_outlined;
      showCard = ShowGoals();
      link = '/Goal';
      break;
    case "Receita":
      name = "Receitas";
      icon = Icons.receipt;
      showCard = ShowReceipts();
      link = '/Receipt';
      break;
    case "Estudo":
      name = "Estudo";
      icon = Icons.book_rounded;
      showCard = ShowStudy();
      link = '/Study';
      break;
    case "Nota":
      name = "Notas";
      icon = Icons.notes;
      showCard = ShowNotes();
      link = '/Note';
      break;
  }
  select = [name, icon, showCard, link];
  print(select);
  return select;
}