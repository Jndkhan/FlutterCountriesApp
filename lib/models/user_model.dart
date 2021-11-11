class UserModel {
  int userId, id;
  String title, body;

  UserModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory UserModel.Json(dynamic json) {
    return UserModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
