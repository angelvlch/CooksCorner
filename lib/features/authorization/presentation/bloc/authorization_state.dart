part of 'authorization_bloc.dart';

class AuthorizationState {
  final AuthorizationEntity entity;

  AuthorizationState(this.entity);
}

class AuthorizationInitial extends AuthorizationState {
  AuthorizationInitial() : super(AuthorizationEntity.empty());
}

class AuthorizationSuccess extends AuthorizationState {
  final AuthorizationResponseModel model;
  AuthorizationSuccess(super.entity, {required this.model});
}

class AuthroizatationUpdate extends AuthorizationState {
  final AuthorizationEntity newEntity;

  AuthroizatationUpdate({required this.newEntity}) : super(newEntity);
}

class AuthorizationFailure extends AuthorizationState {
  final String errorMessage;

  AuthorizationFailure(super.entity, {required this.errorMessage});
}
