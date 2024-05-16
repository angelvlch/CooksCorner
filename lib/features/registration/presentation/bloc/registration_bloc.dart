import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cooks_corner/features/registration/data/data_source/remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegistrationEvent>(_submitData);
    on<EmailChanged>(_updateEmail);
  }

  FutureOr<void> _submitData(
      RegistrationEvent event, Emitter<RegistrationState> emit) async {
    try {
      await RemoteRegistrationDataSource(dio: Dio()).sendData('', '', '', '');
    } catch (e) {
      emit(RegistrationFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _updateEmail(event, Emitter<RegistrationState> emit) {
    emit(RegistrationModelChanged(state.model.copyWith(email: event.email)));
  }
}
