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
NewUser newUserFromJson(String str) => NewUser.fromJson(json.decode(str));

String newUserToJson(NewUser data) => json.encode(data.toJson());

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

// new user create response model

NweuserRes nweuserResFromJson(String str) =>
    NweuserRes.fromJson(json.decode(str));

String nweuserResToJson(NweuserRes data) => json.encode(data.toJson());

class NweuserRes {
  NweuserRes({
    required this.fieldCount,
    required this.affectedRows,
    required this.insertId,
    required this.info,
    required this.serverStatus,
    required this.warningStatus,
  });

  int fieldCount;
  int affectedRows;
  int insertId;
  String info;
  int serverStatus;
  int warningStatus;

  factory NweuserRes.fromJson(Map<String, dynamic> json) => NweuserRes(
        fieldCount: json["fieldCount"],
        affectedRows: json["affectedRows"],
        insertId: json["insertId"],
        info: json["info"],
        serverStatus: json["serverStatus"],
        warningStatus: json["warningStatus"],
      );

  Map<String, dynamic> toJson() => {
        "fieldCount": fieldCount,
        "affectedRows": affectedRows,
        "insertId": insertId,
        "info": info,
        "serverStatus": serverStatus,
        "warningStatus": warningStatus,
      };
}
