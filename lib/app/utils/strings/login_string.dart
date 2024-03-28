enum LoginString {
  logouPediuChegou('Logou, pediu, chegou!'),
  naoTemUmaConta('Não tem uma conta?'),
  cadastreSe('Cadastre-se'),
  ;

  const LoginString(this.texto);
  final String texto;
}
