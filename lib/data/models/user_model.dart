class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String createdAt;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      createdAt: map["created_at"],
      id: map["id"],
      email: map["email"],
      fullName: map["full_name"],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "created_at": createdAt,
      };
}
