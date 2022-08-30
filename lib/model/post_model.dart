import 'dart:convert';

List<PostListRecModel> postListRecModelFromJson(String str) =>
    List<PostListRecModel>.from(
        json.decode(str).map((x) => PostListRecModel.fromJson(x)));

String postListRecModelToJson(List<PostListRecModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostListRecModel {
  PostListRecModel({
    required this.userId,
    required this.postId,
    required this.price,
    required this.year,
    required this.city,
    required this.kmDriven,
    required this.title,
    required this.image1,
    required this.postTime,
    required this.postClick,
  });

  int userId;
  int postId;
  String price;
  int year;
  String city;
  int kmDriven;
  String title;
  String image1;
  DateTime postTime;
  int postClick;

  factory PostListRecModel.fromJson(Map<String, dynamic> json) =>
      PostListRecModel(
        userId: json["user_id"],
        postId: json["post_id"],
        price: json["price"],
        year: json["year"],
        city: json["city"],
        kmDriven: json["km_driven"],
        title: json["title"],
        image1: json["image1"],
        postTime: DateTime.parse(json["post_time"]),
        postClick: json["post_click"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "post_id": postId,
        "price": price,
        "year": year,
        "city": city,
        "km_driven": kmDriven,
        "title": title,
        "image1": image1,
        "post_time": postTime.toIso8601String(),
        "post_click": postClick,
      };
}

List<SinglePostModel> singlePostModelFromJson(String str) =>
    List<SinglePostModel>.from(
        json.decode(str).map((x) => SinglePostModel.fromJson(x)));

String singlePostModelToJson(List<SinglePostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SinglePostModel {
  SinglePostModel({
    required this.uid,
    required this.fb,
    required this.tcaller,
    required this.email,
    required this.name,
    required this.image,
    required this.pass,
    required this.phone,
    required this.wappnumber,
    required this.division,
    required this.city,
    required this.ip,
    required this.time,
    required this.postId,
    required this.userId,
    required this.category,
    required this.brand,
    required this.model,
    required this.title,
    required this.year,
    required this.kmDriven,
    required this.price,
    required this.bikeCondition,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.postClick,
    required this.postTime,
  });

  int uid;
  String fb;
  String tcaller;
  String email;
  String name;
  String image;
  String pass;
  String phone;
  String wappnumber;
  String division;
  String city;
  String ip;
  DateTime time;
  int postId;
  int userId;
  int category;
  String brand;
  String model;
  String title;
  int year;
  int kmDriven;
  String price;
  String bikeCondition;
  String description;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  int postClick;
  DateTime postTime;

  factory SinglePostModel.fromJson(Map<String, dynamic> json) =>
      SinglePostModel(
        uid: json["uid"],
        fb: json["fb"],
        tcaller: json["tcaller"],
        email: json["email"],
        name: json["name"],
        image: json["image"],
        pass: json["pass"],
        phone: json["phone"],
        wappnumber: json["wappnumber"],
        division: json["division"],
        city: json["city"],
        ip: json["ip"],
        time: DateTime.parse(json["time"]),
        postId: json["post_id"],
        userId: json["user_id"],
        category: json["category"],
        brand: json["brand"],
        model: json["model"],
        title: json["title"],
        year: json["year"],
        kmDriven: json["km_driven"],
        price: json["price"],
        bikeCondition: json["bike_condition"],
        description: json["description"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        postClick: json["post_click"],
        postTime: DateTime.parse(json["post_time"]),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "fb": fb,
        "tcaller": tcaller,
        "email": email,
        "name": name,
        "image": image,
        "pass": pass,
        "phone": phone,
        "wappnumber": wappnumber,
        "division": division,
        "city": city,
        "ip": ip,
        "time": time.toIso8601String(),
        "post_id": postId,
        "user_id": userId,
        "category": category,
        "brand": brand,
        "model": model,
        "title": title,
        "year": year,
        "km_driven": kmDriven,
        "price": price,
        "bike_condition": bikeCondition,
        "description": description,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "post_click": postClick,
        "post_time": postTime.toIso8601String(),
      };
}

PageModel pageModelFromJson(String str) => PageModel.fromJson(json.decode(str));

String pageModelToJson(PageModel data) => json.encode(data.toJson());

class PageModel {
  PageModel({
    required this.page,
  });

  String page;

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
      };
}

// user detals recive model

List<Userdetails> userdetailsFromJson(String str) => List<Userdetails>.from(
    json.decode(str).map((x) => Userdetails.fromJson(x)));

String userdetailsToJson(List<Userdetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Userdetails {
  Userdetails({
    required this.uid,
    required this.fb,
    required this.tcaller,
    required this.email,
    required this.name,
    required this.image,
    required this.pass,
    required this.phone,
    required this.wappnumber,
    required this.division,
    required this.city,
    required this.ip,
    required this.time,
  });

  int uid;
  String fb;
  String tcaller;
  String email;
  String name;
  String image;
  String pass;
  String phone;
  String wappnumber;
  String division;
  String city;
  String ip;
  DateTime time;

  factory Userdetails.fromJson(Map<String, dynamic> json) => Userdetails(
        uid: json["uid"],
        fb: json["fb"],
        tcaller: json["tcaller"],
        email: json["email"],
        name: json["name"],
        image: json["image"],
        pass: json["pass"],
        phone: json["phone"],
        wappnumber: json["wappnumber"],
        division: json["division"],
        city: json["city"],
        ip: json["ip"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "fb": fb,
        "tcaller": tcaller,
        "email": email,
        "name": name,
        "image": image,
        "pass": pass,
        "phone": phone,
        "wappnumber": wappnumber,
        "division": division,
        "city": city,
        "ip": ip,
        "time": time.toIso8601String(),
      };
}

PostmodelSend postmodelSendFromJson(String str) =>
    PostmodelSend.fromJson(json.decode(str));

String postmodelSendToJson(PostmodelSend data) => json.encode(data.toJson());

class PostmodelSend {
  PostmodelSend({
    required this.userId,
    required this.category,
    required this.brand,
    required this.model,
    required this.title,
    required this.year,
    required this.kmDriven,
    required this.price,
    required this.bikeCondition,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.city,
  });

  int userId;
  int category;
  String brand;
  String model;
  String title;
  int year;
  int kmDriven;
  String price;
  String bikeCondition;
  String description;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  String city;

  factory PostmodelSend.fromJson(Map<String, dynamic> json) => PostmodelSend(
        userId: json["user_id"],
        category: json["category"],
        brand: json["brand"],
        model: json["model"],
        title: json["title"],
        year: json["year"],
        kmDriven: json["km_driven"],
        price: json["price"],
        bikeCondition: json["bike_condition"],
        description: json["description"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "category": category,
        "brand": brand,
        "model": model,
        "title": title,
        "year": year,
        "km_driven": kmDriven,
        "price": price,
        "bike_condition": bikeCondition,
        "description": description,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "city": city,
      };
}
