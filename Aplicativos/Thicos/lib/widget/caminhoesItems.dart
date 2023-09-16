import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thicos/models/caminhoes.dart';

class CaminhoesItems extends StatefulWidget {
  const CaminhoesItems({super.key, required this.caminhao});

  final Caminhao caminhao;
  @override
  State<CaminhoesItems> createState() => _CaminhoesItemsState();
}

class _CaminhoesItemsState extends State<CaminhoesItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.height * 0.10,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(46, 49, 75, 1),
          width: 3,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(36, 37, 51, 0.678),
            blurRadius: 8,
            offset: Offset(
              4,
              8,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.075,
            decoration: BoxDecoration(
                color: Color.fromRGBO(46, 49, 75, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                border: Border.all(
                  color: Color.fromRGBO(46, 49, 75, 1),
                  width: 3,
                )),
            child: Text(
              widget.caminhao.placa,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 9,
            ),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(46, 49, 75, 1),
                width: 3,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/' + widget.caminhao.foto),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: widget.caminhao.status == "Parado"
                      ? Colors.red
                      : Colors.green,
                  size: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(widget.caminhao.status)
              ],
            ),
          )
        ],
      ),
    );
  }
}
