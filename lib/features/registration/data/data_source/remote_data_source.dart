import 'package:dio/dio.dart';

class RemoteRegistrationDataSource {
  final Dio _dio;

  RemoteRegistrationDataSource({required Dio dio}) : _dio = dio;

  Future<void> sendData(
    String name,
    String password,
    String confirmPassowrd,
    String email,
  ) async {
    try {
      final response = await _dio.post(
        'https://cooks-corner-28c47e768d59.herokuapp.com/api/auth/signUp',
      );
      print('d');
    } on DioException catch (e) {
      print('НАША ОШИБКА ${e.response!.statusCode}|||||');
      throw ('Что-то пошло не так');
    }
  }
}
