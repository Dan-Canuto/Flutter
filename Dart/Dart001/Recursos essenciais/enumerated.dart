enum StatusPagamento { pendente, pago, reembolsado }

void main(List<String> args) {
  StatusPagamento status = StatusPagamento.pendente;

  switch (status) {
    case StatusPagamento.pago:
      break;
    case StatusPagamento.pendente:
      break;
    case StatusPagamento.reembolsado:
      break;
  }

  print(status.index);
}
