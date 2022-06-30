import 'dart:convert';

List<HomeResponse> homeResponseFromJson(String str) => List<HomeResponse>.from(
    json.decode(str).map((x) => HomeResponse.fromJson(x)));

String homeResponseToJson(List<HomeResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeResponse {
  HomeResponse({
    required this.albumId,
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int userId;
  String name;
  String url;
  String thumbnailUrl;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        albumId: json["albumId"],
        userId: json["userId"],
        name: json["name"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "userId": userId,
        "name": name,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
