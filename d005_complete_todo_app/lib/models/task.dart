class Task {
  String title;
  DateTime dateTime;
  bool toggleDone;
  bool toggleRemove;
  int categoryColor;
  bool reminder;

  Task({
    this.title,
    this.dateTime,
    this.toggleDone = false,
    this.toggleRemove = false,
    this.categoryColor = 0xFFE82BAB,
    this.reminder = false,
  });
}
