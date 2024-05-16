import 'package:cooks_corner/features/registration/presentation/bloc/registration_bloc.dart';

abstract class RegistrationRepo {
  Future<void> registration(RegistrationModel model);
}
