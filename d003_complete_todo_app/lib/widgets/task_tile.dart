import 'package:flutter/material.dart';
import 'package:d003_complete_todo_app/models/task.dart';

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

  TaskTile({this.task});

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
                    Image.asset(task.toggleDone
                        ? "assets/images/checked.png"
                        : "assets/images/checked-empty.png"),
                    SizedBox(width: 10.0),
                    Text(
                      task.dateTime,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      task.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                trailing: Image.asset(
                  task.reminder
                      ? "assets/images/bell-small-yellow.png"
                      : "assets/images/bell-small.png",
                  scale: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
