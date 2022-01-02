// To parse this JSON data, do
//
//     final postDetail = postDetailFromJson(jsonString);

import 'dart:convert';

PostDetail postDetailFromJson(dynamic str) => PostDetail.fromJson(str);

String postDetailToJson(PostDetail data) => json.encode(data.toJson());

class PostDetail {
  PostDetail({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory PostDetail.fromJson(Map<String, dynamic> json) => PostDetail(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
