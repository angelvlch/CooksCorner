part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class SubmitData extends RegistrationEvent {}
