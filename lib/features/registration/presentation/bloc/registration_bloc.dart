import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cooks_corner/features/registration/data/data_source/remote_data_source.dart';
import 'package:cooks_corner/features/registration/data/model/registration_model.dart';
import 'package:cooks_corner/features/registration/domain/use_case/registration_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationUseCase useCase;
  RegistrationBloc({required this.useCase}) : super(RegistrationInitial()) {
    on<RegistrationEvent>(_submitData);
    on<EmailChanged>(_updateEmail);
    on<NameChanged>(_updateName);
    on<PasswordChanged>(_updatePassword);
    on<RePassworChanged>(_updateRePassord);
  }

  FutureOr<void> _submitData(
      RegistrationEvent event, Emitter<RegistrationState> emit) async {
    try {} catch (e) {
      //  emit(RegistrationFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _updateEmail(event, Emitter<RegistrationState> emit) {
    final isModelVali = isValid(
        confirmPassword: state.model.confirmPassword,
        email: event.email,
        password: state.model.password,
        name: state.model.userName);

    emit(RegistrationModelChanged(
        state.model.copyWith(email: event.email, isValid: isModelVali)));
  }

  FutureOr<void> _updateName(
      NameChanged event, Emitter<RegistrationState> emit) {
    final isModelVali = isValid(
        confirmPassword: state.model.confirmPassword,
        email: state.model.email,
        password: state.model.password,
        name: event.name);

    emit(RegistrationModelChanged(
        state.model.copyWith(userName: event.name, isValid: isModelVali)));
  }

  FutureOr<void> _updatePassword(
      PasswordChanged event, Emitter<RegistrationState> emit) {
    final isModelVali = isValid(
        confirmPassword: state.model.confirmPassword,
        email: state.model.email,
        password: event.password,
        name: state.model.userName);

    emit(RegistrationModelChanged(
        state.model.copyWith(password: event.password, isValid: isModelVali)));
  }

  FutureOr<void> _updateRePassord(
      RePassworChanged event, Emitter<RegistrationState> emit) {
    final isModelVali = isValid(
        confirmPassword: event.rePassword,
        email: state.model.email,
        password: state.model.password,
        name: state.model.userName);

    emit(RegistrationModelChanged(state.model
        .copyWith(confirmPassword: event.rePassword, isValid: isModelVali)));
  }

  bool isValid(
      {required String name,
      required String password,
      required String confirmPassword,
      required String email}) {
    final isNameValid = RegExp(r'^[a-zA-Z]+$').hasMatch(name) &&
        name.length >= 3 &&
        name.length <= 30;
    final isEmailValid =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(email);
    final isPasswordValid =
        RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&+=]).{8,15}$')
            .hasMatch(password);
    final isConfirmPasswordValid = confirmPassword == password;
    return isNameValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid;
  }
}
