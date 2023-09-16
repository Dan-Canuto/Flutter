import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thicos/models/manutencao.dart';

class ExpandedMenuItems extends StatefulWidget {
  const ExpandedMenuItems({super.key, required this.detalhes});

  final Manutencao? detalhes;
  @override
  State<ExpandedMenuItems> createState() => _ExpandedMenuItemsState();
}

class _ExpandedMenuItemsState extends State<ExpandedMenuItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [],
      ),
    );
  }
}
