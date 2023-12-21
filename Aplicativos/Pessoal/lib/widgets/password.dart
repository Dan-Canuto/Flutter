import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
   String? senha;
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text(
                        senhaController.text,
                        style: TextStyle(
                          color: AppColors.black,
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                senhaController.text += "1";
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                senhaController.text += "2";
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                senhaController.text += "3";
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                senhaController.text += "4";
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                senhaController.text += "5";
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                senhaController.text += "6";
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                senhaController.text += "7";
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                senhaController.text += "8";
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                senhaController.text += "9";
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
                              backgroundColor:AppColors.white,
                            
                              fixedSize: Size(20, 1)),
                          onPressed: () {
                            setState(() {
                              senhaController.clear();
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
                                backgroundColor:
                                    AppColors.c3,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                fixedSize: Size(20, 15)),
                            onPressed: () {
                              setState(() {
                                print('0');
                                senhaController.text += "0";
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
                                backgroundColor: AppColors.white, 
                                fixedSize: Size(20, 15),
                            ),
                            onPressed: () {
                              
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
          );
  }
}