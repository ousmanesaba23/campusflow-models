# CampusFlow Models

Petit package Dart pur construit a partir de l atelier « Les modeles de CampusFlow en Dart pur ».

## Contenu
- Trois modeles immuables : `Task`, `Course` et `User` (`final` fields).
- Constructeurs nommes, `copyWith`, `fromJson` et `toJson`.
- `CampusFlowRepository` simule le chargement de chaque collection avec `Future.delayed`.
- Trois tests : `copyWith`, conversion JSON des trois modeles, et erreur attendue sur une donnee invalide.

## Ouvrir et lancer dans VS Code
1. Installer le SDK Dart, puis ouvrir ce dossier dans VS Code.
2. Dans le terminal integre, recuperer les dependances :

```powershell
dart pub get
```

3. Lancer les tests :

```powershell
dart test
```

4. Pour essayer le depot, creer `bin/demo.dart` ou utiliser la console Dart avec :

```dart
import 'package:campusflow_models/campusflow_models.dart';

Future<void> main() async {
  final repository = CampusFlowRepository();
  final tasks = await repository.loadTasks();
  print(tasks.first.title);
}
```

## Structure
```text
lib/
  campusflow_models.dart
  src/
    task.dart
    course.dart
    user.dart
    json_readers.dart
    campusflow_repository.dart
test/
  campusflow_models_test.dart
```

Les champs obligatoires absents ou de mauvais type declenchent `FormatException`. Le depot est local et simule : aucune API distante n est appelee.
