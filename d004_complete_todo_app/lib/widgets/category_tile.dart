import 'package:flutter/material.dart';

class CategoryTile {
  final Color color;
  final String iconPath;
  final String title;
  final int tasksCount;

  CategoryTile({
    this.color,
    this.iconPath,
    this.title,
    this.tasksCount,
  });

  Widget buildCategory(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 65,
              height: 65,
              child: Image.asset(iconPath),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "$tasksCount Tasks",
              style: TextStyle(
                fontSize: 9,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTileEx {
  final Color color;
  final String title;
  final Function onPress;
  final bool isSelected;

  CategoryTileEx({
    this.color,
    this.title,
    this.onPress,
    this.isSelected,
  });

  Widget buildCategory(BuildContext context) {
    return isSelected
        ? Center(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: color,
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
          )
        : InkWell(
            onTap: onPress,
            child: Center(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 10.0,
                    width: 10.0,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(title),
                  ),
                ],
              ),
            ),
          );
  }
}
