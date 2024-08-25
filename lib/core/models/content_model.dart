// To parse this JSON data, do
//
//     final contentModel = contentModelFromJson(jsonString);

import 'dart:convert';

ContentModel contentModelFromJson(String str) => ContentModel.fromJson(json.decode(str));

String contentModelToJson(ContentModel data) => json.encode(data.toJson());

class ContentModel {
    int? id;
    int? curriculaId;
    String? title;
    dynamic videoUrl;
    dynamic fileUrl;
    String? content;
    DateTime? createdAt;
    DateTime? updatedAt;

    ContentModel({
        this.id,
        this.curriculaId,
        this.title,
        this.videoUrl,
        this.fileUrl,
        this.content,
        this.createdAt,
        this.updatedAt,
    });

    factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        id: json["id"],
        curriculaId: json["curricula_id"],
        title: json["title"],
        videoUrl: json["video_url"],
        fileUrl: json["file_url"],
        content: json["content"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "curricula_id": curriculaId,
        "title": title,
        "video_url": videoUrl,
        "file_url": fileUrl,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
