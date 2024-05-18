class AuthorizationEntity {
  final String email;
  final String password;

  factory AuthorizationEntity.empty() {
    return AuthorizationEntity(
      '',
      '',
    );
  }
  bool isEntityValid() {
    return email != '' && password != '';
  }

  AuthorizationEntity(this.email, this.password);
  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
    };
  }

  AuthorizationEntity copyWith({
    String? password,
    String? email,
  }) {
    return AuthorizationEntity(
      email ?? this.email,
      password ?? this.password,
    );
  }
}
