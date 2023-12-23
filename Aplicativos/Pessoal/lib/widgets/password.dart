import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
   String? password;
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                          passwordController.text,
                          style: TextStyle(
                            color: AppColors.c5,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "1";
                                });
                              },
                              child: const Text(
                                "1",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "2";
                                });
                              },
                              child: const Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "3";
                                });
                              },
                              child: const Text(
                                "3",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "4";
                                });
                              },
                              child: const Text(
                                "4",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "5";
                                });
                              },
                              child: const Text(
                                "5",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "6";
                                });
                              },
                              child: const Text(
                                "6",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "7";
                                });
                              },
                              child: const Text(
                                "7",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "8";
                                });
                              },
                              child: const Text(
                                "8",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "9";
                                });
                              },
                              child: const Text(
                                "9",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                            mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:AppColors.black,
                                elevation: 10,
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                passwordController.clear();
                              });
                            },
                            child: Icon(
                              Icons.backspace_outlined,
                              color: AppColors.c3,
                              size: 18,
                              ),
                          ),                    
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:AppColors.c3,
                                  elevation: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  fixedSize: Size(20, 15)),
                              onPressed: () {
                                setState(() {
                                  passwordController.text += "0";
                                });
                              },
                              child: const Text(
                                "0",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.black,
                                  elevation: 10,
                                  fixedSize: Size(20, 15),
                              ),
                              onPressed: () {
                                if(passwordController.text == "1804"){
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/HomePage',
                                  );
                                }else{
                                  setState(() {
                                    passwordController.clear();
                                  });
                                  showDialog<void>(
                                    context: context,
                                    barrierColor: Color.fromRGBO(15, 15, 15, 0.8),
                                    useSafeArea: false,
                                    barrierDismissible: true, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        elevation: 10,
                                        title: Center(
                                          child: const Text(
                                            'Senha Incorreta bem',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              child: Icon(
                                Icons.subdirectory_arrow_right,
                                color: AppColors.c3,
                                size: 18,
                                ),
                            ),
                          ]
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}