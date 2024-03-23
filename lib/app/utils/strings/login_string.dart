enum LoginString {
  logouPediuChegou('Logou, pediu, chegou!'),
  email('Email'),
  senha('Senha'),
  entrar('Entrar'),
  naoTemUmaConta('Não tem uma conta?'),
  cadastreSe('Cadastre-se'),
  ;

  const LoginString(this.texto);
  final String texto;
}
