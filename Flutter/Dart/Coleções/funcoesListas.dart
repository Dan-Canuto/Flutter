void main(List<String> args) {
  List<int> idades = [1, 2, 3, 4, 5, 6, 7];

  idades.add(4);

  idades.addAll([20, 30, 3]);

  idades.insert(2, 21);

  print(idades.contains(30));
  print(idades.indexOf(30));

  print(idades.remove(4));
  print(idades.removeAt(3));

  idades.shuffle();

  idades.clear();

  print(idades);
}
