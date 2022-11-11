import 'dart:convert';

class User {
  String username;
  String email;
  String? profile;
  User({
    required this.username,
    required this.email,
    this.profile,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'email': email});
    if (profile != null) {
      result.addAll({'profile': profile});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      profile: map['profile'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
