enum HomeString {
  valorDaEntrega('R\$ 4,99'),
  custoDaEntrega('Custo da entrega'),
  temEmMinutos('45-60 min'),
  tempoEstimado('Tempo estimado'),
  enderecoDeEntrega('Endereço de entrega'),
  endereco('Endereço'),
  numero('Número'),
  bairro('Bairro'),
  ;

  const HomeString(this.texto);
  final String texto;
}