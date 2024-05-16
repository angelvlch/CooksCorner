import 'package:cooks_corner/features/registration/data/data_source/remote_data_source.dart';
import 'package:cooks_corner/features/registration/domain/repository/registratrion_repo.dart';
import 'package:cooks_corner/features/registration/presentation/bloc/registration_bloc.dart';

class RegistrationRepoImpl implements RegistrationRepo {
  final RemoteRegistrationDataSource _dataSource;

  const RegistrationRepoImpl({@required this._dataSource});
  @override
  Future<void> registration(RegistrationModel model) {
    // TODO: implement registration
    throw UnimplementedError();
  }
}
