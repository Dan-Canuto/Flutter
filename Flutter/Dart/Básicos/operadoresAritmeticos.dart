void main(List<String> args) {
  double n1 = 10.5;
  double n2 = 42.3;
  int n3 = 3;

  double r1 = n1 + n2;
  double r2 = n1 - n2;
  double r3 = n1 / (n2 + n3);
  double r4 = n1 * n2 - 10;

  print(r1);
  print(r2);
  print(r3);
  print(r4);

  n1 += 10;
  n1 -= 10;
  n1 /= 10;
  n1 *= 10;
  print(n1);

  n3++;
  n3--;

  print(n3);

  print(n3 % 5); //Resto da divisão
}
