class Treatment {
  final String name;
  final String description;

  Treatment({
    required this.name,
    required this.description,
  });

  factory Treatment.fromMap(Map<String, dynamic> data) {
    return Treatment(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
