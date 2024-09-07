class UserModel {
  final String id;
  final String active;
  final String age;
  final String caseType;
  final String email;
  final String fullName;
  final String gender;
  final List<Map<String, bool>> medicalHistory;
  final String nationalId;
  final String password;
  final String phoneNum;
  final String profilePic;
  final String teeth;

  UserModel({
    required this.id,
    required this.active,
    required this.age,
    required this.caseType,
    required this.email,
    required this.fullName,
    required this.gender,
    required this.medicalHistory,
    required this.nationalId,
    required this.password,
    required this.phoneNum,
    required this.profilePic,
    required this.teeth,
  });

  // Convert UserModel to User entity
  // UserEntities toEntity() {
  //   return UserEntities(
  //     active: active,
  //     age: age,
  //     caseType: caseType,
  //     email: email,
  //     fullName: fullName,
  //     gender: gender,
  //     medicalHistory: medicalHistory,
  //     nationalId: nationalId,
  //     password: password,
  //     phoneNum: phoneNum,
  //     profilePic: profilePic,
  //     teeth: teeth,
  //   );
  // }

  // Create UserModel from a map (e.g., Firebase data)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      active: map['active'],
      age: map['age'],
      caseType: map['caseType'],
      email: map['email'],
      fullName: map['fullName'],
      gender: map['gender'],
      medicalHistory: map['medicalHistory'],
      nationalId: map['nationalId'],
      password: map['password'],
      phoneNum: map['phoneNum'],
      profilePic: map['profilePic'],
      teeth: map['teeth'],
    );
  }

  // Convert UserModel to a map (e.g., for Firebase)
  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'age': age,
      'caseType': caseType,
      'email': email,
      'fullName': fullName,
      'gender': gender,
      'medicalHistory': medicalHistory,
      'nationalId': nationalId,
      'password': password,
      'phoneNum': phoneNum,
      'profilePic': profilePic,
      'teeth': teeth,
    };
  }
}
