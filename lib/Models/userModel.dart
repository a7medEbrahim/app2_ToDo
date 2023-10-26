class UserModel {
  String id;
  String name;
  String email;

  UserModel({required this.id, required this.name, required this.email});

  UserModel.FromJason(Map<String, dynamic> jason)
      : this(
          id: jason['id'],
          name: jason['name'],
          email: jason['email'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
    };
  }
}
