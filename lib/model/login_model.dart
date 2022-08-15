import 'dart:convert';

//! udimodel
List<Uidmodel> uidmodelFromJson(String str) =>
    List<Uidmodel>.from(json.decode(str).map((x) => Uidmodel.fromJson(x)));

String uidmodelToJson(List<Uidmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Uidmodel {
  Uidmodel({
    required this.uid,
  });

  int uid;

  factory Uidmodel.fromJson(Map<String, dynamic> json) => Uidmodel(
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
      };
}

// new user model

List<NewUser> newUserFromJson(String str) =>
    List<NewUser>.from(json.decode(str).map((x) => NewUser.fromJson(x)));

String newUserToJson(List<NewUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewUser {
  NewUser({
    required this.fb,
    required this.tcaller,
    required this.email,
    required this.name,
    required this.image,
    required this.pass,
    required this.phone,
    required this.wappnumber,
  });

  String fb;
  String tcaller;
  String email;
  String name;
  String image;
  String pass;
  String phone;
  String wappnumber;

  factory NewUser.fromJson(Map<String, dynamic> json) => NewUser(
        fb: json["fb"],
        tcaller: json["tcaller"],
        email: json["email"],
        name: json["name"],
        image: json["image"],
        pass: json["pass"],
        phone: json["phone"],
        wappnumber: json["wappnumber"],
      );

  Map<String, dynamic> toJson() => {
        "fb": fb,
        "tcaller": tcaller,
        "email": email,
        "name": name,
        "image": image,
        "pass": pass,
        "phone": phone,
        "wappnumber": wappnumber,
      };
}
