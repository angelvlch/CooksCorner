import 'dart:convert';

import 'package:cooks_corner/features/authorization/data/model/authorization_responce_model.dart';
import 'package:cooks_corner/features/authorization/domain/entity/authorization_model.dart';
import 'package:dio/dio.dart';

class AuthorizationDataSource {
  final Dio _dio;

  AuthorizationDataSource({required Dio dio}) : _dio = dio;
  Future<AuthorizationResponseModel> sendData(
      AuthorizationEntity entity) async {
    try {
      final response = await _dio.post(
          'https://cooks-corner-28c47e768d59.herokuapp.com/api/auth/logIn',
          data: entity.toJson());
      final data = response.data;
      return AuthorizationResponseModel.fromJson(json: data);
    } on DioException catch (error) {
      throw (error.response!.data['message']);
    }
  }
}
