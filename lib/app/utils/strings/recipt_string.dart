enum ReceiptString {
  detalhesDoPedido('Detalhes do pedido'),
  obrigadoPeloSeuPedido('Obrigado pelo seu pedido!'),
  aquiEstaOSeuRecibo('Aqui está o seu recibo:'),
  divisorDePedidos(
      '--------------------------------------------------------------'),
  custoDaEntrega('Custo da entrega:'),
  totalDeItens('Total de itens:'),
  totalAPagar('Total a pagar:'),
  tempoEstimadoParaEntrega('Tempo estimado para entrega'),
  entregaConfirmada('Entrega confirmada'),
  confirmarEntrega('Confirmar entrega'),
  entrarEmContato('Entrar em contato'),
  erroAoCarregarPedido('Erro ao carregar pedido'),
  pedidoNaoEncontrado('Pedido não encontrado'),
  ;

  const ReceiptString(this.texto);
  final String texto;
}
