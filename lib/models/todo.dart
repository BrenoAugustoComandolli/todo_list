class ToDo {

  ToDo({required this.title, required this.dateTime});

  ToDo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        dateTime = DateTime.parse(json['dateTime']);

  String title;
  DateTime dateTime;

  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'dateTime': dateTime.toIso8601String(),
    };
  }

}