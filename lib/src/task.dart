import 'json_readers.dart';

/// Represents a task assigned in a CampusFlow course.
class Task {
  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.courseId,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final String description;
  final String courseId;
  final bool isCompleted;

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? courseId,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      courseId: courseId ?? this.courseId,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: readRequiredString(json, 'id'),
        title: readRequiredString(json, 'title'),
        description: readRequiredString(json, 'description'),
        courseId: readRequiredString(json, 'courseId'),
        isCompleted: json.containsKey('isCompleted')
            ? readRequiredBool(json, 'isCompleted')
            : false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'courseId': courseId,
        'isCompleted': isCompleted,
      };
}
