class BaseStrings {
  // Generic
  static const empty = "";
  static const defaultInvalidField = "Campo invalido";
  static const defaultFieldError = "Este campo não foi preenchido corretamente";
  static const defaultRequestErrorText =
      "Houve um problema com a requisição, verifique sua conexão com a rede";
  static const salt = "32.7tkvmo5.g2wdf";

  // Login
  static const loginFieldEmail = "e-mail";
  static const loginFieldPassword = "senha";
  static const loginButtonLogin = "Login";
  static const loginButtonRegister = "Cadastrar-se";
  static const loginRequestErrorText =
      "Houve um problema com a requisição, verifique sua conexão com a rede e suas credencias de login";

  // Register
  static const registerAppBarTitle = "Cadastro de Usuário";
  static const registerFieldName = "nome completo *";
  static const registerFieldEmail = "e-mail *";
  static const registerFieldPassword = "senha *";
  static const registerFieldPasswordTooltip =
      "A senha deve ter no mínimo 8 caracteres, com ao menos uma letra e um número.";
  static const registerFieldPasswordAgain = "confirme sua senha *";
  static const registerButtonRegister = "Cadastrar";
  static const registerEmailRegex =
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static const registerPasswordRegex =
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\*?@!#$%&-]{8,}$';
  static const registerEmailErrorEmpty = "Por favor preencha o campo de e-mail";
  static const registerEmailErrorInvalid = "Este e-mail não é valido";
  static const registerNameError = "Por favor preencha o campo de nome";

  static const registerPasswordErrorEmpty =
      "Por favor preencha o campo de senha";

  static const registerPasswordErrorInvalid = "Esta senha não é válida";

  static const registerPasswordAgainErrorEmpty =
      "Por favor preencha o campo de senha";

  static const registerPasswordAgainErrorInvalid =
      "As duas senhas devem ser iguais";
}
