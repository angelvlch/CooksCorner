part of 'registration_bloc.dart';

sealed class RegistrationEvent {}

class SubmitData extends RegistrationEvent {}

class EmailChanged extends RegistrationEvent {
  final String email;

  EmailChanged({required this.email});
}

class NameChanged extends RegistrationEvent {
  final String name;

  NameChanged({required this.name});
}

class PassworChanged extends RegistrationEvent {
  final String password;

  PassworChanged({required this.password});
}

class RePassworChanged extends RegistrationEvent {
  final String rePassword;

  RePassworChanged({required this.rePassword});
}
