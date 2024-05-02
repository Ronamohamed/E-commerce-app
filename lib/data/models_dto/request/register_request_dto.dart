class RegisterRequestDTO {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  RegisterRequestDTO(
      {this.name, this.email, this.password, this.rePassword, this.phone});

  RegisterRequestDTO.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["rePassword"] is String) {
      rePassword = json["rePassword"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["password"] = password;
    data["rePassword"] = rePassword;
    data["phone"] = phone;
    return data;
  }
}
