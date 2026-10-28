import 'package:campusflow_models/campusflow_models.dart';
import 'package:test/test.dart';

void main() {
  test('copyWith cree une copie sans modifier le modele original', () {
    const original = Task(
      id: 't1',
      title: 'Lire le cours',
      description: 'Chapitre 1',
      courseId: 'c1',
    );

    final updated =
        original.copyWith(title: 'Terminer le cours', isCompleted: true);

    expect(updated.title, 'Terminer le cours');
    expect(updated.isCompleted, isTrue);
    expect(updated.id, original.id);
    expect(original.isCompleted, isFalse);
  });

  test('fromJson construit correctement les trois modeles', () {
    final task = Task.fromJson({
      'id': 't1',
      'title': 'Lire',
      'description': 'Chapitre 1',
      'courseId': 'c1',
      'isCompleted': true,
    });
    final course = Course.fromJson({
      'id': 'c1',
      'title': 'Dart',
      'description': 'Introduction',
      'instructorId': 'u1',
    });
    final user =
        User.fromJson({'id': 'u1', 'name': 'Awa', 'email': 'awa@example.com'});

    expect(task.isCompleted, isTrue);
    expect(course.title, 'Dart');
    expect(user.email, 'awa@example.com');
  });

  test('fromJson signale une erreur si un champ obligatoire est invalide', () {
    expect(
      () => User.fromJson({'id': 'u1', 'name': 'Awa', 'email': 42}),
      throwsFormatException,
    );
  });
}
