void main(List<String> args) {
//if else
  int idade = 16;

  if (idade > 18) {
    print('É maior de idade');
  } else if (idade == 18) {
    print('É maior de idade e acabou de se tornar');
  } else {
    print('É menor de idade');
  }

//operadores lógicos
  int n = 10;
  //comparadores
  bool op1 = n == 15;
  bool op2 = n != 10;
  bool op3 = n > 10;
  bool op4 = n >= 10;
  bool op5 = n < 10;
  bool op6 = n <= 10;
  //Operadores lógicos
  bool opl1 = op1 && op2;
  bool opl2 = op3 || op5 && op6;
  bool opl3 = !op4;
  print(opl1);
  print(opl2);
  print(opl3);

  print(n == 15);
}
