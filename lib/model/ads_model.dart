//Banner ads model

import 'dart:convert';

List<BannerAdsList> bannerAdsListFromJson(String str) =>
    List<BannerAdsList>.from(
        json.decode(str).map((x) => BannerAdsList.fromJson(x)));

String bannerAdsListToJson(List<BannerAdsList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerAdsList {
  BannerAdsList({
    required this.bannerId,
    required this.image,
    required this.text,
    required this.postTime,
  });

  int bannerId;
  String image;
  String text;
  DateTime postTime;

  factory BannerAdsList.fromJson(Map<String, dynamic> json) => BannerAdsList(
        bannerId: json["banner_id"],
        image: json["image"],
        text: json["text"],
        postTime: DateTime.parse(json["post_time"]),
      );

  Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "image": image,
        "text": text,
        "post_time": postTime.toIso8601String(),
      };
}
