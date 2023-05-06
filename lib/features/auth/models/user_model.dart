class UserModel {
  final String id, username;

  UserModel({
    required this.id,
    required this.username,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'];
}
