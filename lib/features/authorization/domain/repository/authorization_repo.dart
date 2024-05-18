import 'package:cooks_corner/features/authorization/data/model/authorization_responce_model.dart';
import 'package:cooks_corner/features/authorization/domain/entity/authorization_model.dart';

abstract class AuthorizationRepo {
  Future<AuthorizationResponseModel> authorization(AuthorizationEntity entity);
}
