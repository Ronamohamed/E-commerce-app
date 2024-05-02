import 'package:e_commerce/domain/entities/register_response_entity.dart';

class RegisterResponseDTO {
  String? statusMsg;
  String? message;
  UserDTO? user;
  String? token;

  RegisterResponseDTO({this.statusMsg, this.message, this.user, this.token});

  RegisterResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : UserDTO.fromJson(json["user"]);
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusMsg'] = statusMsg;
    data["message"] = message;
    if (user != null) {
      data["user"] = user?.toJson();
    }
    data["token"] = token;
    return data;
  }

  RegisterResponseEntitiy toRegisterResponseEntity() {
    return RegisterResponseEntitiy(
        message: message,
        statusMsg: statusMsg,
        token: token,
        user: user?.toUserEntity());
  }
}

class UserDTO {
  String? name;
  String? email;
  String? role;

  UserDTO({this.name, this.email, this.role});

  UserDTO.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["role"] = role;
    return data;
  }

  UserEntity toUserEntity() {
    return UserEntity(name: name, email: email, role: role);
  }
}
