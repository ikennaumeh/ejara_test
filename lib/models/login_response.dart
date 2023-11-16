class LoginResponse {
  String? message, token;

  LoginResponse({this.message, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json["message"],
      token: json["token"],
    );
  }
}