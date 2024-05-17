import 'package:cooks_corner/features/registration/data/data_source/remote_data_source.dart';
import 'package:cooks_corner/features/registration/data/model/registration_model.dart';
import 'package:cooks_corner/features/registration/domain/repository/registratrion_repo.dart';
import 'package:cooks_corner/features/registration/presentation/bloc/registration_bloc.dart';

class RegistrationRepoImpl implements RegistrationRepo {
  final RemoteRegistrationDataSource dataSource;

  const RegistrationRepoImpl({required this.dataSource});
  @override
  Future<void> registration(RegistrationModel model) async {
    await dataSource.sendData(model);
  }
}
