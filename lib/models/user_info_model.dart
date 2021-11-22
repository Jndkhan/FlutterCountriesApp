class UserInfoModel {
  int id;
  String name;
  String avatar;
  String email;

  UserInfoModel(
      {required this.id,
      required this.name,
      required this.avatar,
      required this.email});

  factory UserInfoModel.Json(dynamic json) {
    return UserInfoModel(
        id: json['id'],
        name: json['name'],
        avatar: json['avatar'],
        email: json['email']);
  }
}
