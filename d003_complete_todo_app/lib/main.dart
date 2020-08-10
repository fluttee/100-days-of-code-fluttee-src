import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kButtonColor = 0xFFE82BAB;
const kBottomAppBarIconSize = 30.0;
const kTopSectionColor1 = 0xFF4274DA;
const kTopSectionColor2 = 0xFF7CBEF3;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = List<BaseTile>.generate(
    50,
    (i) => i % 6 == 0
        ? HeadingTile(title: "Heading $i")
        : TaskTile(
            dateTime: DateFormat.jm().format(DateTime.now()),
            title: "Title $i",
            toggleDone: false,
            reminder: true,
            color: kButtonColor,
          ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopSection(),
          _buildMainSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(kButtonColor),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                "assets/images/home.png",
                scale: 0.8,
              ),
              Image.asset(
                "assets/images/task.png",
                scale: 0.8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTopSection() {
    return Expanded(
      flex: 2,
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      const Color(kTopSectionColor1),
                      const Color(kTopSectionColor2),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            Positioned(
              left: -100,
              top: -200,
              child: Container(
                width: 300,
                height: 300,
                decoration: new BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: -20,
              top: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: new BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SafeArea(
              child: Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello Brenda",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            Text("Today you have 9 tasks"),
                          ],
                        ),
                        CircleAvatar(
                          child: Image.asset("assets/images/photo.png"),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today Reminder",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Text("Meeting with client"),
                                Text("13:00 PM"),
                              ],
                            ),
                            Image.asset("assets/images/bell-left.png"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildMainSection() {
    return Expanded(
      flex: 5,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return item.buildTile(context);
        },
      ),
    );
  }
}

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
  final String title;
  final String dateTime;
  final bool toggleDone;
  final bool reminder;
  final int color;

  TaskTile({
    this.title,
    this.dateTime,
    this.toggleDone,
    this.reminder,
    this.color,
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
                color: Color(color),
              ),
            ),
            Expanded(
              flex: 50,
              child: ListTile(
                title: Row(
                  children: [
                    Image.asset(toggleDone
                        ? "assets/images/checked.png"
                        : "assets/images/checked-empty.png"),
                    SizedBox(width: 10.0),
                    Text(
                      dateTime,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                trailing: Image.asset(
                  reminder
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
