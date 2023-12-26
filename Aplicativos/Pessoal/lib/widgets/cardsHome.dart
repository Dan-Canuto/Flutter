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
              GestureDetector(
                onTap: (){
                  print("foi");
                } ,
                child: Card(
                  elevation: 10,
                  color: AppColors.c5,
                  child: Container(
                    height: mediaQuery.size.height * 0.3,
                    width: mediaQuery.size.width * 0.45,
                    child: CardsHomeContent(blackCard: false,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("foi");
                } ,
                child: Card(
                  elevation: 10,
                  color: AppColors.black1,
                  child: Container(
                    height: mediaQuery.size.height * 0.3,
                    width: mediaQuery.size.width * 0.45,
                    child: CardsHomeContent(blackCard: true,),
                  ),
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
              GestureDetector(
                onTap: (){
                  print("foi");
                } ,
                child: Card(
                  elevation: 10,
                  color: AppColors.black1,
                  child: Container(
                    height: mediaQuery.size.height * 0.3,
                    width: mediaQuery.size.width * 0.45,
                    child: CardsHomeContent(blackCard: true,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("foi");
                } ,
                child: Card(
                  elevation: 10,
                  color: AppColors.c5,
                  child: Container(
                    height: mediaQuery.size.height * 0.3,
                    width: mediaQuery.size.width * 0.45,
                    child: CardsHomeContent(blackCard: false,),
                  ),
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
              GestureDetector(
                onTap: (){
                  print("foi");
                } ,
                child: Card(
                  elevation: 10,
                  color: AppColors.c5,
                  child: Container(
                    height: mediaQuery.size.height * 0.3,
                    width: mediaQuery.size.width * 0.45,
                    child: CardsHomeContent(blackCard: false,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("foi");
                } ,
                child: Card(
                  elevation: 10,
                  color: AppColors.black1,
                  child: Container(
                    height: mediaQuery.size.height * 0.3,
                    width: mediaQuery.size.width * 0.45,
                    child: CardsHomeContent(blackCard: true,),
                  ),
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