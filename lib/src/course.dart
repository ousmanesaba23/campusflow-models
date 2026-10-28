import 'json_readers.dart';

/// Represents a course available on CampusFlow.
class Course {
  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructorId,
  });

  final String id;
  final String title;
  final String description;
  final String instructorId;

  Course copyWith({
    String? id,
    String? title,
    String? description,
    String? instructorId,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      instructorId: instructorId ?? this.instructorId,
    );
  }

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: readRequiredString(json, 'id'),
        title: readRequiredString(json, 'title'),
        description: readRequiredString(json, 'description'),
        instructorId: readRequiredString(json, 'instructorId'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'instructorId': instructorId,
      };
}
