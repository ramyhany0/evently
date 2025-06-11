class User {
  String? id;
  String? name;
  String? age;
  String? email;
  String? gender;
  User({this.age, this.email, this.name, this.id, this.gender});
  User.fromFirebase(Map<String, dynamic> data) {
    id = data?['id'];
    name = data?['name'];
    age = data?['age'];
    email = data?['email'];
    gender = data?['gender'];
  }
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'gender': gender,
    };
  }
}
