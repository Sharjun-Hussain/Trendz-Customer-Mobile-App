class User {
  final String email;
  final int
      id; // Assuming password is provided during login, but not used in response
  final bool
      status; // Assuming no avatar in response; consider making it optional
  final String fullName;
  final String token;
  // final int age; // Add a fallback or nullable type if age can be null
  // final String dob; // Add a fallback or nullable type if dob can be null
  // final String gender; // Add a fallback or nullable type if gender can be null
  // final String phoneNumber;
  // final bool isEmailVerified;

  User({
    required this.email,
    required this.id,
    required this.token,
    // required this.avatar,
    required this.fullName,
    required this.status,
    // required this.age,
    // required this.dob,
    // required this.gender,
    // required this.phoneNumber,
    // required this.isEmailVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return User(
        email: data['email'],
        id: data['id'],
        token: json['token'],
        status: data['status'],
        fullName: data['name']
        // Provide default if null

        );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "id": id,
      "fullname": fullName,
      "token": token,
      "status": status
    };
  }
}
