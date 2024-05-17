import 'package:cooks_corner/features/registration/data/model/registration_model.dart';
import 'package:cooks_corner/features/registration/domain/repository/registratrion_repo.dart';
import 'package:cooks_corner/features/registration/presentation/bloc/registration_bloc.dart';

class RegistrationUseCase {
  final RegistrationRepo repo;

  RegistrationUseCase({required this.repo});
  Future<void> call(RegistrationModel model) async {
    await repo.registration(model);
  }
}
