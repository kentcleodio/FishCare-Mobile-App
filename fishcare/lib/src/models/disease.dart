class Disease {
  final String name;
  final String description;
  final List<String> symptom;

  Disease({
    required this.name,
    required this.description,
    required this.symptom,
  });

  factory Disease.fromMap(Map<String, dynamic> data) {
    return Disease(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      symptom: List<String>.from(data['symptom'] ?? []),
    );
  }
}
