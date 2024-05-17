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

class RegistrationFailure extends RegistrationState {
  final String errorMessage;

  RegistrationFailure(super.model, {required this.errorMessage});
}
