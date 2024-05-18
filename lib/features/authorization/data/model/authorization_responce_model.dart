class AuthorizationResponseModel {
  final String token;

  AuthorizationResponseModel({required this.token});
  factory AuthorizationResponseModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return AuthorizationResponseModel(token: json['token'] as String);
  }
}
