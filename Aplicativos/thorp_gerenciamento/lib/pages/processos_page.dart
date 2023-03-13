import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ProcessosPage extends StatefulWidget {
  const ProcessosPage({super.key});

  @override
  State<ProcessosPage> createState() => _ProcessosPageState();
}

class _ProcessosPageState extends State<ProcessosPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Processos",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
