class User {
  String email;
  String name;
  String password;
  String phoneNo;

  User(
      {required this.email,
      required this.name,
      required this.phoneNo,
      required this.password});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        email: parsedJson['email'] ?? '',
        name: parsedJson['name'] ?? '',
        phoneNo: parsedJson['phoneNo'] ?? '',
        password: parsedJson['password'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'phoneNo': phoneNo
    };
  }
}
