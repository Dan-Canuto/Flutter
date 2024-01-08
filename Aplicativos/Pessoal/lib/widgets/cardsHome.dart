import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';
import 'package:organizer/widgets/cardsHomeContent.dart';

class CardsHome extends StatelessWidget {
  const CardsHome({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 0.85,
      padding: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.025),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: mediaQuery.size.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                color: AppColors.c5,
                child: Container(
                  height: mediaQuery.size.height * 0.3,
                  width: mediaQuery.size.width * 0.45,
                  child: CardsHomeContent(blackCard: false, name: "Academia",),
                ),
              ),
              Card(
                elevation: 10,
                color: AppColors.black1,
                child: Container(
                  height: mediaQuery.size.height * 0.3,
                  width: mediaQuery.size.width * 0.45,
                  child: CardsHomeContent(blackCard: true, name: "Trabalho"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                color: AppColors.black1,
                child: Container(
                  height: mediaQuery.size.height * 0.3,
                  width: mediaQuery.size.width * 0.45,
                  child: CardsHomeContent(blackCard: true, name: "Meta"),
                ),
              ),
              Card(
                elevation: 10,
                color: AppColors.c5,
                child: Container(
                  height: mediaQuery.size.height * 0.3,
                  width: mediaQuery.size.width * 0.45,
                  child: CardsHomeContent(blackCard: false,name: "Receita"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                color: AppColors.c5,
                child: Container(
                  height: mediaQuery.size.height * 0.3,
                  width: mediaQuery.size.width * 0.45,
                  child: CardsHomeContent(blackCard: false, name: "Estudo",),
                ),
              ),
              Card(
                elevation: 10,
                color: AppColors.black1,
                child: Container(
                  height: mediaQuery.size.height * 0.3,
                  width: mediaQuery.size.width * 0.45,
                  child: CardsHomeContent(blackCard: true, name: "Nota",),
                ),
              ),
            ],
          ),
           SizedBox(
            height: mediaQuery.size.height * 0.01,
          ),
        ],
      ),
    );
  }
}