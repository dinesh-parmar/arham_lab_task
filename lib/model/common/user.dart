class User {
  final String? emailId;
  final String? password;

  User({this.emailId, this.password});

  @override
  bool operator ==(Object other) => (other is User) && other.emailId == emailId && other.password == password;

  factory User.fromJson(Map<String, String> mapData) => User(emailId: mapData["emailId"], password: mapData["password"]);

  Map<String, String?> toJson() => {"emailId": emailId, "password": password};

  @override
  String toString() => toJson().toString();

  @override
  int get hashCode => emailId.hashCode ^ password.hashCode;
}
