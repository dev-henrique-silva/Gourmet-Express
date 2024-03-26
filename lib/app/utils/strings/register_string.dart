enum RegisterString {
  crieSuaContaEAproveite('Crie sua conta e aproveite!'),
  email('Email'),
  senha('Senha'),
  confirarSenha('Confirmar Senha'),
  criarConta('Criar Conta'),
  jaPossuiUmaConta('Já possui uma conta?'),
  voltarParaOLogin('Voltar para o login'),
  contaCriadaComSucesso('Conta criada com sucesso!'),
  sucesso('Sucesso'),
  erro('Erro'),
  ;

  const RegisterString(this.texto);
  final String texto;
}
