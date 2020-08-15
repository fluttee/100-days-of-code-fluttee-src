import 'package:flutter/material.dart';

class Task {
  String title;
  DateTime dateTime;
  bool toggleDone;
  bool toggleRemove;
  Color categoryColor;
  bool reminder;

  Task({
    this.title,
    this.dateTime,
    this.toggleDone = false,
    this.toggleRemove = false,
    this.categoryColor,
    this.reminder = false,
  });
}

class Tasks {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  int get length => _tasks.length;

  void removeAt(int index) {
    _tasks.removeAt(index);
  }

  void add(Task task) {
    _tasks.add(task);
  }

  Task elementAt(int index) {
    return _tasks.elementAt(index);
  }
}
