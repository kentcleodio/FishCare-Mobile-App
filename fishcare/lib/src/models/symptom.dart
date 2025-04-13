import '../components/mycustomwidgets.dart';

class Symptom {
  final String name;
  final String image;
  final String description;
  final List<String> cause;
  final List<String> possibleDisease;
  final List<String> treatment;

  Symptom({
    required this.name,
    required this.image,
    required this.description,
    required this.cause,
    required this.possibleDisease,
    required this.treatment,
  });

  factory Symptom.fromMap(Map<String, dynamic> data) {
    return Symptom(
      name: data['name'] ?? '',
      image: data['image'] ?? noImgUrl,
      description: data['description'] ?? '',
      cause: List<String>.from(data['cause'] ?? []),
      possibleDisease: List<String>.from(data['possibleDisease'] ?? []),
      treatment: List<String>.from(data['treatment'] ?? []),
    );
  }
}
