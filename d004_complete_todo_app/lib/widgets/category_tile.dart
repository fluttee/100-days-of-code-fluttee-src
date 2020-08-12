import 'package:flutter/material.dart';

class CategoryTile {
  final Color color;
  final String title;
  final Function onPress;
  final bool isSelected;

  CategoryTile({
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
