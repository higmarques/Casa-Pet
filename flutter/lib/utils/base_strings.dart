class BaseStrings {
  // ## Generic ##
  static const empty = "";
  static const defaultInvalidField = "Campo invalido";
  static const defaultFieldError = "Este campo não foi preenchido corretamente";
  static const defaultRequestErrorText =
      "Houve um problema com a requisição, verifique sua conexão com a rede";
  static const salt = "32.7tkvmo5.g2wdf";
  static const nullRouteFeedback = "NO ROUTE WITH NAME \$1";

  // ## Login ##
  // Login - Form
  static const loginFieldEmail = "e-mail";
  static const loginFieldPassword = "senha";
  static const loginButtonLogin = "Login";
  static const loginButtonRegister = "Cadastrar-se";
  // Login - Feedback
  static const loginRequestErrorText =
      "Houve um problema com a requisição, verifique sua conexão com a rede e suas credencias de login";

  // ## Register ##
  static const registerAppBarTitle = "Cadastro de Usuário";
  // Register - Form
  static const registerFieldName = "nome completo *";
  static const registerFieldEmail = "e-mail *";
  static const registerFieldPassword = "senha *";
  static const registerFieldPasswordAgain = "confirme sua senha *";
  static const registerFieldPasswordTooltip =
      "A senha deve ter no mínimo 8 caracteres, com ao menos uma letra e um número.";
  static const registerButtonRegister = "Cadastrar";
  // Register - Field validation regex
  static const registerEmailRegex =
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static const registerPasswordRegex =
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\*?@!#$%&-]{8,}$';
  // Register - Field validation feedback
  static const registerEmailErrorEmpty = "Por favor preencha o campo de e-mail";
  static const registerEmailErrorInvalid = "Este e-mail não é valido";
  static const registerNameError = "Por favor preencha o campo de nome";
  static const registerPasswordErrorEmpty =
      "Por favor preencha o campo de senha";
  static const registerPasswordErrorInvalid = "Esta senha não é válida";
  static const registerPasswordAgainErrorEmpty =
      "Por favor preencha o campo de confirmar senha";
  static const registerPasswordAgainErrorInvalid =
      "As duas senhas devem ser iguais";

  // ## Dashboard ##
  static const dashboardAppBarTitle = "Adotar um pet";
  // Dashboard - Bottom navigation bar
  static const dashboardBarAdopt = "Adote";
  static const dashboardBarDonate = "Doe";
  // Dashboard - Cell
  static const dashboardCellName = "Nome: ";
  static const dashboardCellSex = "Sexo: ";
  static const dashboardCellType = "Tipo: ";
  static const dashboardCellSize = "Porte: ";

  // ## NewPet ##
  static const newPetAppBarTitle = "Cadastro de Pet";
  // NewPet - Form
  static const newPetFieldName = "nome do pet *";
  static const newPetFieldType = "tipo *";
  static const newPetFieldSize = "porte *";
  static const newPetFieldLocation = "localização *";
  static const newPetFieldRace = "raça *";
  static const newPetFieldSex = "sexo *";
  static const newPetFieldIsNeutered = "é castrado *";
  static const newPetFieldDescription = "descrição";
  static const newPetFieldPhoto = "uplaod de imagem";
  static const newPetButtonAddPet = "Cadastrar Pet";
  static const newPetFormNotValidText = "Preencha todos os campos obrigatórios";
  // NewPet - Dropbox options
  static const newPetTypeDog = "Cão";
  static const newPetTypeCat = "Gato";
  static const newPetTypeBird = "Pássaro";
  static const newPetTypeFish = "Peixe";
  static const newPetTypeRodent = "Roedor";
  static const newPetTypeReptile = "Réptil";
  static const newPetTypeOther = "Outro";
  static const newPetSizeSmall = "Pequeno";
  static const newPetSizeMedium = "Médio";
  static const newPetSizeBig = "Grande";
  static const newPetSexMale = "Macho";
  static const newPetSexFemale = "Fêmea";
  static const newPetSexDontApply = "Não se aplica";
  static const newPetIsNeuteredYes = "Sim";
  static const newPetIsNeuteredNo = "Não";
  // NewPet - Field Validation Regex
  static const newPetNameError = "Por favor preencha o campo de nome";
  static const newPetTypeError = "Por favor selecione um tipo de pet";
  static const newPetSizeError = "Por favor selecione um porte para o pet";
  static const newPetLocationError =
      "Por favor preencha o campo de localização";
  static const newPetRaceError = "Por favor o campo de raça";
  static const newPetSexError = "Por favor selecione um sexo para o pet";
  static const newPetNeuteredError =
      "Por favor selecione se o pet foi castrado";
  static const newPetDescriptionError = "Descrição excedendo 250 caracteres";
}
