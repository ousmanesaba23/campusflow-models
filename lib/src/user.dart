import 'json_readers.dart';

/// Represents a student, teacher, or administrator using CampusFlow.
class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
  });

  final String id;
  final String name;
  final String email;

  User copyWith({String? id, String? name, String? email}) => User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: readRequiredString(json, 'id'),
        name: readRequiredString(json, 'name'),
        email: readRequiredString(json, 'email'),
      );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}
