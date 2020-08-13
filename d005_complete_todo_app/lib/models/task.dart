class Task {
  String title;
  DateTime dateTime;
  bool toggleDone;
  int categoryColor;
  bool reminder;

  Task({
    this.title,
    this.dateTime,
    this.toggleDone = false,
    this.categoryColor = 0xFFE82BAB,
    this.reminder = false,
  });
}
