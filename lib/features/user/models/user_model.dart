class UserModel {
  final String uid;
  final String name;
  final String email;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        name = json["name"],
        email = json["email"];

  UserModel.empty()
      : uid = "",
        name = "",
        email = "";
}
