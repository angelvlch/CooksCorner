part of 'registration_bloc.dart';

abstract class RegistrationState {
  final RegistrationModel model;
  const RegistrationState(this.model);
}

class RegistrationInitial extends RegistrationState {
  RegistrationInitial() : super(RegistrationModel.empty());
}

class RegistrationModelChanged extends RegistrationState {
  final RegistrationModel model;
  RegistrationModelChanged(this.model) : super(model);
}

class RegistrationModel {
  final String email;
  final String userName;
  final String password;
  final String confirmPassword;
  final bool isValidForRegistration;

  factory RegistrationModel.empty() {
    return RegistrationModel('', '', '', '', false);
  }

  RegistrationModel(
    this.email,
    this.userName,
    this.password,
    this.confirmPassword,
    this.isValidForRegistration,
  );

  RegistrationModel copyWith({
    @required isValid,
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
