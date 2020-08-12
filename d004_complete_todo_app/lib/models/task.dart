import 'package:d004_complete_todo_app/main.dart';

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
    this.categoryColor = kButtonColor,
    this.reminder = false,
  });
}
