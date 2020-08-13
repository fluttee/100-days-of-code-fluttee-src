import 'package:flutter/material.dart';
import 'package:d005_complete_todo_app/models/task.dart';
import 'package:intl/intl.dart';

/// The base class for the different types of items the list can contain.
abstract class BaseTile {
  /// The title line to show in a list item.
  Widget buildTile(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingTile implements BaseTile {
  final String title;

  HeadingTile({this.title});

  Widget buildTile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

/// A ListItem that contains data to display a message.
class TaskTile implements BaseTile {
  final Task task;
  final Function checkedCallback;
  final Function notifiedCallback;

  TaskTile({
    this.task,
    this.checkedCallback,
    this.notifiedCallback,
  });

  Widget buildTile(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Color(task.categoryColor),
              ),
            ),
            Expanded(
              flex: 50,
              child: ListTile(
                title: Row(
                  children: [
                    InkWell(
                      onTap: checkedCallback,
                      child: Image.asset(task.toggleDone
                          ? "assets/images/checked.png"
                          : "assets/images/checked-empty.png"),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      DateFormat.jm().format(task.dateTime),
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: task.toggleDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      task.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            task.toggleDone ? Colors.grey : Colors.deepPurple,
                        decoration: task.toggleDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                trailing: InkWell(
                  onTap: notifiedCallback,
                  child: Image.asset(
                    task.reminder
                        ? "assets/images/bell-small-yellow.png"
                        : "assets/images/bell-small.png",
                    scale: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
