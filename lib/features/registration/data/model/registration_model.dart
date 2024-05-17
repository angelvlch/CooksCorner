class RegistrationModel {
  final String email;
  final String userName;
  final String password;
  final String confirmPassword;
  final bool isValidForRegistration;

  factory RegistrationModel.empty() {
    return RegistrationModel('', '', '', '', false);
  }

  bool isPasswordTheSame() {
    return password == confirmPassword || confirmPassword == '';
  }

  bool isNameValid() {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(userName) &&
            userName.length >= 3 &&
            userName.length <= 30 ||
        userName == '' ||
        userName.isEmpty;
  }

  bool isEmailValid() {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(email) ||
        email == '';
  }

  bool isPasswordValid() {
    return RegExp(
                r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&+=]).{8,15}$')
            .hasMatch(password) ||
        password == '';
  }

  bool isRegistrationValid() {
    return isNameValid() &&
        isEmailValid() &&
        isPasswordTheSame() &&
        isPasswordValid();
  }

  RegistrationModel(
    this.email,
    this.userName,
    this.password,
    this.confirmPassword,
    this.isValidForRegistration,
  );
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': userName,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }

  RegistrationModel copyWith({
    required isValid,
    String? email,
    String? userName,
    String? password,
    String? confirmPassword,
  }) {
    return RegistrationModel(
        email ?? this.email,
        userName ?? this.userName,
        password ?? this.password,
        confirmPassword ?? this.confirmPassword,
        isValid);
  }
}
