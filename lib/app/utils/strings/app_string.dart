enum AppString {
  email('Email'),
  senha('Senha'),
  entrar('Entrar'),
  cancelar('Cancelar'),
  confirmar('Confirmar'),
  salvar('Salvar'),
  sucesso('Sucesso'),
  erro('Erro'),
  gourmetExpress('Gourmet Express'),
  carrinhoDeCompras('Carrinho de compras'),
  apagarTudo('Apagar tudo'),
  temCertezaQueDesejaApagarTodosOsItensDoCarrinho(
      "Tem certeza que deseja apagar todos os itens do carrinho?"),
  textVazio(''),
  contato('Contato'),
  meusPedidos('Meus pedidos'),
  total('Total: '),
  pagamento('Pagamento'),
  comprarAgora('Comprar agora'),
  pedidoConcluido('Pedido concluído'),
  pedidoEmAndamento('Pedido em andamento'),
  voceAindaNaoPossuiPedidos('Você não possui pedidos'),
  ;

  const AppString(this.texto);
  final String texto;
}
