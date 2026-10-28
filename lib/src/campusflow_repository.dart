import 'course.dart';
import 'task.dart';
import 'user.dart';

/// In-memory repository that imitates a network request with a short delay.
class CampusFlowRepository {
  CampusFlowRepository({this.latency = const Duration(milliseconds: 500)});

  final Duration latency;

  static const _usersJson = <Map<String, dynamic>>[
    {'id': 'u1', 'name': 'Awa Traore', 'email': 'awa@example.com'},
    {'id': 'u2', 'name': 'Moussa Diallo', 'email': 'moussa@example.com'},
  ];

  static const _coursesJson = <Map<String, dynamic>>[
    {
      'id': 'c1',
      'title': 'Introduction a Dart',
      'description': 'Bases du langage Dart.',
      'instructorId': 'u2',
    },
    {
      'id': 'c2',
      'title': 'Conception logicielle',
      'description': 'Principes de conception et de qualite.',
      'instructorId': 'u2',
    },
  ];

  static const _tasksJson = <Map<String, dynamic>>[
    {
      'id': 't1',
      'title': 'Lire les bases de Dart',
      'description': 'Etudier les types et les variables.',
      'courseId': 'c1',
      'isCompleted': false,
    },
    {
      'id': 't2',
      'title': 'Ecrire un premier modele',
      'description': 'Creer une classe immuable.',
      'courseId': 'c1',
      'isCompleted': true,
    },
  ];

  Future<List<User>> loadUsers() async {
    await Future<void>.delayed(latency);
    return List.unmodifiable(_usersJson.map(User.fromJson));
  }

  Future<List<Course>> loadCourses() async {
    await Future<void>.delayed(latency);
    return List.unmodifiable(_coursesJson.map(Course.fromJson));
  }

  Future<List<Task>> loadTasks() async {
    await Future<void>.delayed(latency);
    return List.unmodifiable(_tasksJson.map(Task.fromJson));
  }
}
