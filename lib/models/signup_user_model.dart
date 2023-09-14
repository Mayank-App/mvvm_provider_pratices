class SignUpUserModel{
  String email;
  String password;
  SignUpUserModel({required this.email, required this.password});

  Map<String, dynamic> toJSON(){
    return {
      "email":email,
      "password":password
    };
  }
}