import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cooks_corner/features/authorization/data/model/authorization_responce_model.dart';
import 'package:cooks_corner/features/authorization/domain/entity/authorization_model.dart';
import 'package:cooks_corner/features/authorization/domain/use_case/authorization_use_case.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final AuthorizationUseCase useCase;
  AuthorizationBloc({required this.useCase}) : super(AuthorizationInitial()) {
    on<NameChanged>(_updateName);
    on<PasswordChanged>(_updatePassword);
    on<SubmitData>(_logIn);
  }

  FutureOr<void> _updateName(
      NameChanged event, Emitter<AuthorizationState> emit) {
    emit(AuthroizatationUpdate(
        newEntity: state.entity.copyWith(email: event.name)));
  }

  FutureOr<void> _updatePassword(
      PasswordChanged event, Emitter<AuthorizationState> emit) {
    emit(AuthroizatationUpdate(
        newEntity: state.entity.copyWith(password: event.password)));
  }

  FutureOr<void> _logIn(
      SubmitData event, Emitter<AuthorizationState> emit) async {
    try {
      final response = await useCase.call(event.entity);
      emit(AuthorizationSuccess(state.entity, model: response));
    } catch (error) {
      emit(AuthorizationFailure(state.entity, errorMessage: error.toString()));
    }
  }
}
