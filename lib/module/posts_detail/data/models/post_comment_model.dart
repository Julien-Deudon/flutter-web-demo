// To parse this JSON data, do
//
//     final postDetail = postDetailFromJson(jsonString);

import 'dart:convert';

List<PostComment> postCommentsFromJson(dynamic str) =>
    List<PostComment>.from(str.map((x) => PostComment.fromJson(x)));

String postCommentsToJson(List<PostComment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostComment {
  PostComment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  factory PostComment.fromJson(Map<String, dynamic> json) => PostComment(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
