class UserModel {
  String id;
  String fristName;
  String lastName;
  String userName;
  String email;

  UserModel(
      {required this.id,
      required this.fristName,
      required this.lastName,
      required this.userName,
      required this.email});

  UserModel.fromjson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            fristName: json['fristName'],
            lastName: json['lastName'],
            userName: json['userName'],
            email: json['email']);


  Map<String , dynamic>toJson(){
    return {
      'id':id,
      'fristName': fristName,
      'lastName':lastName ,
      'userName':userName ,
      'email':email

    };
  }
}

