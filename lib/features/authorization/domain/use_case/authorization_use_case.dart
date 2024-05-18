import 'package:cooks_corner/features/authorization/data/repository/authorization_repo_imp.dart';
import 'package:cooks_corner/features/authorization/domain/entity/authorization_model.dart';
import 'package:cooks_corner/features/authorization/data/model/authorization_responce_model.dart';

class AuthorizationUseCase {
  final AuthorizationRepoImp repo;

  AuthorizationUseCase({required this.repo});
  Future<AuthorizationResponseModel> call(AuthorizationEntity model) {
    return repo.authorization(model);
  }
}
