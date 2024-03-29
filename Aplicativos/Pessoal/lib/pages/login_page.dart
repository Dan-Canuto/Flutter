import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';
import 'package:organizer/widgets/password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return  SafeArea(
      child: Center(
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
              height: mediaQuery.size.height * 0.35,
              decoration: BoxDecoration(
                color: AppColors.c1,
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 1,
                  color: AppColors.white,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black,
                    offset: Offset(5, 5),
                    blurRadius: 20,
                  )
                ],
                borderRadius: BorderRadius.circular(20)
              ),
              child: 
                  Center(child: Password()),
            ),
          ],
        ),
      ),
    );
  }
}