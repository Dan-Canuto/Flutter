import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(149, 122, 86, 1),
      child: const Center(
        child: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
