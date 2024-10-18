class UserModel {
  final String age;
  final String email;
  final String firstName;
  final String secondName;
  final String gender;
  final Map<String, dynamic> medicalHistory;
  final String phoneNum;
  final String profilePic;
  final String id;

  UserModel({
    required this.age,
    required this.email,
    required this.firstName,
    required this.secondName,
    required this.gender,
    required this.medicalHistory,
    required this.phoneNum,
    required this.profilePic,
    required this.id,
  });

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
      id: map['id'],
    );
  }

  // Convert UserModel to a map (e.g., for Firebase)
  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'gender': gender,
      'medicalHistory': medicalHistory,
      'phoneNum': phoneNum,
      'profilePic': profilePic,
      'id': id,
    };
  }
}
