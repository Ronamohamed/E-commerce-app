class LoginRequestDTO {
  String? email;
  String? password;

  LoginRequestDTO({this.email, this.password});

  LoginRequestDTO.fromJson(Map<String, dynamic> json) {
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}
