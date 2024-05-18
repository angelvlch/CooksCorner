import 'package:cooks_corner/features/registration/data/model/registration_model.dart';

import 'package:dio/dio.dart';

class RemoteRegistrationDataSource {
  final Dio _dio;

  RemoteRegistrationDataSource({required Dio dio}) : _dio = dio;

  Future<void> sendData(RegistrationModel model) async {
    try {
      await _dio.post(
        'https://cooks-corner-28c47e768d59.herokuapp.com/api/auth/signUp',
        data: model.toJson(),
      );
      print('ff');
    } on DioException catch (e) {
      final errorMessage = e.response!.data['message'];

      throw (errorMessage);
    }
  }
}
