// To parse this JSON data, do
//
//     final coursesModel = coursesModelFromJson(jsonString);

import 'dart:convert';

CoursesModel coursesModelFromJson(String str) => CoursesModel.fromJson(json.decode(str));

String coursesModelToJson(CoursesModel data) => json.encode(data.toJson());

class CoursesModel {
  int? id;
  String? name;
  String? price;
  String? overview;
  String? language;
  int? numberOfLessons;
  List<String>? whatYouWillLearn;
  String? type;
  int? hours;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Curriculum>? curriculums;

  CoursesModel({
    this.id,
    this.name,
    this.price,
    this.overview,
    this.language,
    this.numberOfLessons,
    this.whatYouWillLearn,
    this.type,
    this.hours,
    this.createdAt,
    this.updatedAt,
    this.curriculums,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) => CoursesModel(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    overview: json["overview"],
    language: json["language"],
    numberOfLessons: json["number_of_lessons"],
    whatYouWillLearn: json["what_you_will_learn"] == null ? [] : List<String>.from(json["what_you_will_learn"]!.map((x) => x)),
    type: json["type"],
    hours: json["hours"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    curriculums: json["curriculums"] == null ? [] : List<Curriculum>.from(json["curriculums"]!.map((x) => Curriculum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "overview": overview,
    "language": language,
    "number_of_lessons": numberOfLessons,
    "what_you_will_learn": whatYouWillLearn == null ? [] : List<dynamic>.from(whatYouWillLearn!.map((x) => x)),
    "type": type,
    "hours": hours,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "curriculums": curriculums == null ? [] : List<dynamic>.from(curriculums!.map((x) => x.toJson())),
  };
}

class Curriculum {
  int? id;
  int? courseId;
  String? sectionName;
  String? sectionTitle;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  List<Content>? contents;

  Curriculum({
    this.id,
    this.courseId,
    this.sectionName,
    this.sectionTitle,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.contents,
  });

  factory Curriculum.fromJson(Map<String, dynamic> json) => Curriculum(
    id: json["id"],
    courseId: json["course_id"],
    sectionName: json["section_name"],
    sectionTitle: json["section_title"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    contents: json["contents"] == null ? [] : List<Content>.from(json["contents"]!.map((x) => Content.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_id": courseId,
    "section_name": sectionName,
    "section_title": sectionTitle,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
  };
}

class Content {
  int? id;
  int? curriculaId;
  String? title;
  dynamic videoUrl;
  dynamic fileUrl;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  Content({
    this.id,
    this.curriculaId,
    this.title,
    this.videoUrl,
    this.fileUrl,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
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
