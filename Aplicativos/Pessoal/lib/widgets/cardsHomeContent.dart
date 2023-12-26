import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';

class CardsHomeContent extends StatelessWidget {
  const CardsHomeContent({super.key, required this.blackCard});
  final bool blackCard;
  @override
  Widget build(BuildContext context) {
    Color color = blackCard ? AppColors.c5 : AppColors.black1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Academia',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Icon(Icons.sports_gymnastics, color: color,)
        ],
      ),
    );
  }
}