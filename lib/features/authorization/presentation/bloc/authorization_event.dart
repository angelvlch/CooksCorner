part of 'authorization_bloc.dart';

abstract class AuthorizationEvent {}

class SubmitData extends AuthorizationEvent {
  final AuthorizationEntity entity;

  SubmitData({required this.entity});
}

class NameChanged extends AuthorizationEvent {
  final String name;

  NameChanged({required this.name});
}

class PasswordChanged extends AuthorizationEvent {
  final String password;

  PasswordChanged({required this.password});
}
