import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';
import 'package:organizer/widgets/password.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: mediaQuery.size.height * 0.2,
              width: mediaQuery.size.width * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.1,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: mediaQuery.size.width * 0.8,
              height: mediaQuery.size.height * 0.4,
              decoration: BoxDecoration(
                color: AppColors.c1,
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 1,
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Password(),
                ],
              ),
            ),
          ],
        ),
      )

      
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}