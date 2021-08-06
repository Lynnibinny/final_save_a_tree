class User {
  String useId;
  String useMail;
  String useUserName;
  String useSavedTrees;
  String useDonated;
  String usePassword;
  String useGoals;

  User(
      {this.useId,
      this.useMail,
      this.useUserName,
      this.useSavedTrees,
      this.useDonated,
      this.usePassword,
      this.useGoals});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      useId: json['UseId'] as String,
      useMail: json['UseMail'] as String,
      useUserName: json['UseUserName'] as String,
      useSavedTrees: json['UseSavedTrees'] as String,
      useDonated: json['UseDonated'] as String,
      usePassword: json['UsePassword'] as String,
      useGoals: json['UseGoals'] as String,
    );
  }
}
//data return to database