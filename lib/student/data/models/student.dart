class StudentModel {
  final String id;
  final String name;
  final String year;
  final String email;
  final String profilePic;
  final String phone;
  StudentModel({
    required this.name,
    required this.id,
    required this.year,
    required this.email,
    required this.profilePic,
    required this.phone,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json['name'],
      id: json['id'],
      year: json['year'],
      email: json['email'],
      profilePic: json['profilePic'],
      phone: json['phone'],
    );
  }
}
