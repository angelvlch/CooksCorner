import 'package:cooks_corner/features/authorization/data/model/authorization_responce_model.dart';
import 'package:cooks_corner/features/authorization/data/remote/authorization_data_source.dart';
import 'package:cooks_corner/features/authorization/domain/entity/authorization_model.dart';
import 'package:cooks_corner/features/authorization/domain/repository/authorization_repo.dart';

class AuthorizationRepoImp implements AuthorizationRepo {
  final AuthorizationDataSource dataSource;

  AuthorizationRepoImp({required this.dataSource});
  @override
  Future<AuthorizationResponseModel> authorization(
      AuthorizationEntity entity) async {
    return await dataSource.sendData(entity);
  }
}
