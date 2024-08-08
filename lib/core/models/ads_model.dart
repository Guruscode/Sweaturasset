// To parse this JSON data, do
//
//     final adsModel = adsModelFromJson(jsonString);

import 'dart:convert';

AdsModel adsModelFromJson(String str) => AdsModel.fromJson(json.decode(str));

String adsModelToJson(AdsModel data) => json.encode(data.toJson());

class AdsModel {
  int? id;
  String? title;
  String? content;
  dynamic imageUrl;
  dynamic linkUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  AdsModel({
    this.id,
    this.title,
    this.content,
    this.imageUrl,
    this.linkUrl,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    imageUrl: json["image_url"],
    linkUrl: json["link_url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "image_url": imageUrl,
    "link_url": linkUrl,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
