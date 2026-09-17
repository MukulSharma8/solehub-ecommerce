class User {
  final String id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        name = json["name"],
        email = json["email"];
}