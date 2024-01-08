import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';
import 'package:organizer/widgets/cardsHome.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Material(
        child: Container(
          color: AppColors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.05,
                decoration: BoxDecoration(
                  color: AppColors.black1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 0),
                      blurRadius: 10,

                    )
                  ]
                  
                ),
                child: Center(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      color: AppColors.c5,
                      fontSize: 20,
                      
                    ),
                    textAlign: TextAlign.center,
                    ),
                ),
              ),
              CardsHome(),
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.05,
                decoration: BoxDecoration(
                  color: AppColors.black1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-2, 0),
                      blurRadius: 10,

                    )
                  ]
                  
                ),
                child: Center(
                  child: Text(
                    'DCP',
                    style: TextStyle(
                      color: AppColors.c5,
                      fontSize: 20,
                      
                    ),
                    textAlign: TextAlign.center,
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}