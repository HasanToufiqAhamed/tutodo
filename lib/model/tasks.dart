class Tasks {
  Tasks({
    this.active,
    this.id,
    this.title,
    this.time,
  });

  int? active;
  int? id;
  String? title;
  String? time;

  factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
    active: json["active"],
    id: json["_id"],
    title: json["title"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "_id": id,
    "title": title,
    "time": time,
  };

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "active": active,
      "id": id,
      "title": title,
      "time": time,
    };
    return map;
  }

  Tasks.fromMap(Map<String, dynamic> map) {
    active = map["active"];
    id = map["id"];
    title = map["title"];
    time = map["time"];
  }
}