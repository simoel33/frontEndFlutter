class UserModel {
  int id;
  String firstname;
  String lastname;
  String cin;
  String dose1;
  String dose2;
  String dose3;

  UserModel(this.id, this.firstname, this.lastname, this.cin, this.dose1,
      this.dose2, this.dose3);
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(json['id'], json['firstname'], json['lastname'],
        json['cin'], json['dose1'], json['dose2'], json['dose3']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'cin': cin,
      'dose1': dose1,
      'dose2': dose2,
      'dose3': dose3,
    };
  }
}
