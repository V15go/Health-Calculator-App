class usermodel {
  String? name;

  String? email;
  String? uid;



  usermodel({this.name,
      this.email, this.uid});

  factory usermodel.fromMap(map){
    return usermodel(
        name : map['name'],

        email: map['email'],
        uid: map['uid']
    );

  }

  Map<String, dynamic> toMap(){
    return{
      'name' : name,

      'email' : email,
      'uid' : uid
    };
  }


}