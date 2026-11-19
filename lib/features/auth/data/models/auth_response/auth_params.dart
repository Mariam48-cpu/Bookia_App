class AuthParams {
  final String? name;
  final String email;
  final String password;
  final String? passwordConfirmation;

  AuthParams({
     this.name,
    required this.email,
    required this.password,
     this.passwordConfirmation,
  });
  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
