class TaskModel {
  String id;
  String title;
  String describtion;
  int date;
  bool isDone;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.describtion,
      required this.date,
      this.isDone = false});

  TaskModel.FromJason(Map<String, dynamic> jason)
      : this(
          id: jason['id'],
          isDone: jason['isDone'],
          date: jason['date'],
          title: jason['title'],
          describtion: jason['describtion'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "describtion": describtion,
      "date": date,
      "isDone": isDone,
    };
  }
}
