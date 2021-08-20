class User {
  int useId;
  String useMail;
  String useUserName;
  int useSavedTrees;
  double useDonated;
  int useGoals;
  //String usePassword;

  User(
      {this.useId,
      this.useMail,
      this.useUserName,
      this.useSavedTrees,
      this.useDonated,
      this.useGoals
      //this.usePassword
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        useId: int.parse(json['UseId']),
        useMail: json['UseMail'] as String,
        useUserName: json['UseUserName'] as String,
        useSavedTrees: int.parse(json['UseSavedTrees']), 
        useDonated: double.parse(json['UseDonated']), //usePassword: json['UsePassword'] as String,
        useGoals: int.parse(json['UseGoals'])
        );
  }
}
//data return to database useDonated: json['UseDonated'] as double, useGoals: json['UseGoals'] as int,

