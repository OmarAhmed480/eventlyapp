class MyUser {
  // TODO: Collection Name
  static const String nameCollection = "Users";

  // TODO: Variables
  String name;
  String email;
  String id;

  // TODO: Constructor
  MyUser({required this.id, required this.name, required this.email});

  // TODO: Object to JSON
  Map<String, dynamic> toJsonFirestore() {
    return {"id": id, "email": email, "name": name};
  }

  // TODO: JSON to Object
  MyUser.fromJsonFirestore(Map<String, dynamic> data)
    : this(id: data["id"], name: data["name"], email: data["email"]);
}
