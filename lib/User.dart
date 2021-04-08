class User {
  String id;
  String proMail;
  String proUserName;
  

  User({this.id,this.proMail, this.proUserName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      proMail: json['proMail'] as String,
      proUserName: json['proUserName'] as String,
    );
  }
}
//data return to database