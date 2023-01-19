void main(List<String> args) {
  Map<int, String> ddds = {11: 'São Paulo', 19: 'Campinas', 41: 'Curitiba'};

  print(ddds[11]); //Retorno de String nula

  print(ddds.length);

  ddds[61] = 'Brasilia';
  print(ddds);

  ddds.remove(49);
  print(ddds);

  print(ddds.values);
  print(ddds.keys);

  print(ddds.containsKey(11));
  print(ddds.containsValue('São Paulo'));

  print(ddds.isEmpty);
  print(ddds.isNotEmpty);
}
