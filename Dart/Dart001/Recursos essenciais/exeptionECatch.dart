void main(List<String> args) {
  try {
    int resultado = 100 ~/ 2;
    print(resultado);

    double valor = double.parse('50.2a');
    double? valor1 = double.tryParse('50.2a');
    if (valor1 != null) {
      print(valor.isFinite);
    }

    print(valor);
  } on FormatException catch (e) {
    print('Caiu no format exception ${e.message}');
  } on UnsupportedError {
    print('Caiu aqui');
  } catch (e) {
    print(e.runtimeType);
  } finally {
    print('Final 22');
  }
}
