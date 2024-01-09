import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';
import 'package:organizer/functions.dart';

class CardsHomeContent extends StatelessWidget {
  const CardsHomeContent({super.key, required this.blackCard, required this.name});
  final bool blackCard;
  final String name;
  @override
  Widget build(BuildContext context) {
    Color color = blackCard ? AppColors.c5 : AppColors.black1;
    List<dynamic>? content = SelectContentCards(name);
    Widget show = content![2];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
                onTap: (){
                  print(content?[3]);
                } ,
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              content?[0],
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child:show,
            ),
            Icon(
              content?[1],
              color: color,
            )
          ],
        ),
      ),
    );
  }
}