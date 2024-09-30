class StudentModel {
  final String id;
  final String name;
  final String year;
  final String email;

  StudentModel({
    required this.name,
    required this.id,
    required this.year,
    required this.email,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json['name'],
      id: json['id'],
      year: json['year'],
      email: json['email'],
    );
  }
}
