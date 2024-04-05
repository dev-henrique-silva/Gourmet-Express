enum CreditCardString {
  validade('VALIDADE'),
  mmaa('MM/AA'),
  numeroDoCartao('Número do cartão'),
  xxxxXxxxXxxxXxxx('XXXX XXXX XXXX XXXX'),
  dataDeValidade('Data de validade'),
  xxxx('XX/XX'),
  cvv('CVV'),
  xxx('XXX'),
  titularDoCartao('Titular do cartão'),
  insiraUmNumeroDeCartaoValido('Insira um número de cartão válido'),
  insiraUmaDataValida('Insira uma data válida'),
  insiraUmCvvValido('Insira um CVV válido'),
  confirmarSuaCompra('Confirme sua compra'),
  confirmarACompra('Confirmar a compra'),
  ;

  const CreditCardString(this.texto);
  final String texto;
}
