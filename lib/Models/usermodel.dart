class User {
  final String email;
  final String
      password; // Assuming password is provided during login, but not used in response
  final String
      avatar; // Assuming no avatar in response; consider making it optional
  final String fullName;
  final int age; // Add a fallback or nullable type if age can be null
  final String dob; // Add a fallback or nullable type if dob can be null
  final String gender; // Add a fallback or nullable type if gender can be null
  final String phoneNumber;
  final bool isEmailVerified;

  User({
    required this.email,
    required this.password,
    required this.avatar,
    required this.fullName,
    required this.age,
    required this.dob,
    required this.gender,
    required this.phoneNumber,
    required this.isEmailVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? "", // Provide default if null
      password: json['password'] ??
          "", // Assuming password isn't included in the response
      avatar: json['avatar'] ?? "", // Provide default if null
      fullName: json['name'] ?? "", // Default if null
      age: json['age'] ?? 0, // Provide a default value for int type if null
      dob: json['dob'] ?? "", // Provide default if null
      gender: json['gender'] ?? "", // Provide default if null
      phoneNumber: json['phone_number'] ?? "", // Default if null
      isEmailVerified:
          json['email_verified_at'] != null, // True/false based on nullability
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "avatar": avatar,
      "full_name": fullName,
      "age": age,
      "dob": dob,
      "gender": gender,
      "phone_number": phoneNumber,
      "is_email_verified": isEmailVerified,
    };
  }
}
