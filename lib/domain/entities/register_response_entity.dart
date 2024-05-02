class RegisterResponseEntitiy {
  String? statusMsg;
  String? message;
  UserEntity? user;
  String? token;

  RegisterResponseEntitiy(
      {this.statusMsg, this.message, this.user, this.token});
}

class UserEntity {
  String? name;
  String? email;
  String? role;

  UserEntity({this.name, this.email, this.role});
}
