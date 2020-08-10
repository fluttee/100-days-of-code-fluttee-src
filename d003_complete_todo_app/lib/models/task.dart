class Task {
  String title;
  String dateTime;
  bool toggleDone;
  int categoryColor;
  bool reminder;

  Task({
    this.title,
    this.dateTime,
    this.toggleDone = false,
    this.categoryColor,
    this.reminder,
  });
}
