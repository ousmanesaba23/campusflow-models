/// Reads a required, non-empty string from decoded JSON.
String readRequiredString(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is! String || value.trim().isEmpty) {
    throw FormatException('Le champ "$key" doit etre une chaine non vide.');
  }
  return value;
}

/// Reads a required boolean from decoded JSON.
bool readRequiredBool(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is! bool) {
    throw FormatException('Le champ "$key" doit etre un booleen.');
  }
  return value;
}
