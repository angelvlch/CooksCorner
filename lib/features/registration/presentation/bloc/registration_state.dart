part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationFailure extends RegistrationState {
  final String errorMessage;

  RegistrationFailure({required this.errorMessage});
}
