import 'dart:convert';

List<LocationModel> locationModelFromJson(String str) =>
    List<LocationModel>.from(
        json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationModelToJson(List<LocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  LocationModel({
    required this.division,
    required this.city,
  });

  String division;
  String city;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        division: json["division"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "division": division,
        "city": city,
      };
}

//update location model

LocationUpdateModel locationUpdateModelFromJson(String str) =>
    LocationUpdateModel.fromJson(json.decode(str));

String locationUpdateModelToJson(LocationUpdateModel data) =>
    json.encode(data.toJson());

class LocationUpdateModel {
  LocationUpdateModel({
    required this.uid,
    required this.division,
    required this.city,
  });

  int uid;
  String division;
  String city;

  factory LocationUpdateModel.fromJson(Map<String, dynamic> json) =>
      LocationUpdateModel(
        uid: json["uid"],
        division: json["division"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "division": division,
        "city": city,
      };
}
