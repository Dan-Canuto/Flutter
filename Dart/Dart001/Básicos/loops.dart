void main(List<String> args) {
//While
  int i = 0;
  int j = 75;

  while (i <= 100 && j > -200) {
    print(i);
    print(j);
    i++;
    j -= 10;
  }

  print('Terminou');

//do While
  int p = 10;

  do {
    print(p);
    p++;
  } while (p > 10);

//for
  for (int t = 10; i >= 0; i--) {
    for (int l = 0; i <= 10; i++) {
      print('t: $t');
      print('l: $l');
    }
  }
}
