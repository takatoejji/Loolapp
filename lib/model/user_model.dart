class UserModel {
  String uid;
  String email;
  String username;
  UserModel({this.uid, this.email, this.username});
  //fetching data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map["email"],
      username: map["username"],
    );
  }
  //sending data to our fbs
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      "username": username,
    };
  }
}
