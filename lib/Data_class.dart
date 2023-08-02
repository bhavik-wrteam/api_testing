// To parse this JSON data, do
//
//     final dataModelClass = dataModelClassFromJson(jsonString);

import 'dart:convert';

List<DataModelClass> dataModelClassFromJson(String str) => List<DataModelClass>.from(json.decode(str).map((x) => DataModelClass.fromJson(x)));

String dataModelClassToJson(List<DataModelClass> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModelClass {
  int userId;
  int id;
  String title;
  String body;

  DataModelClass({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory DataModelClass.fromJson(Map<String, dynamic> json) => DataModelClass(
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
