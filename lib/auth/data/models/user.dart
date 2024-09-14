class UserModel {
  final String age;
  final String email;
  final String firstName;
  final String secondName;
  final String gender;
  final List<Map<String, bool>> medicalHistory;
  final String phoneNum;
  final String profilePic;

  UserModel({
    required this.age,
    required this.email,
    required this.firstName,
    required this.secondName,
    required this.gender,
    required this.medicalHistory,
    required this.phoneNum,
    required this.profilePic,
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
      age: map['age'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      gender: map['gender'],
      medicalHistory: map['medicalHistory'],
      phoneNum: map['phoneNum'],
      profilePic: map['profilePic'],
    );
  }

  // Convert UserModel to a map (e.g., for Firebase)
  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'email': email,
      'fullName': firstName,
      'gender': gender,
      'medicalHistory': medicalHistory,
      'phoneNum': phoneNum,
      'profilePic': profilePic,
    };
  }
}
