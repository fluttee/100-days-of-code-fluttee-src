import 'package:flutter/material.dart';
import 'package:d005_complete_todo_app/constants.dart';
import 'package:d005_complete_todo_app/widgets/category_tile.dart';
import 'package:d005_complete_todo_app/widgets/task_tile.dart';
import 'package:d005_complete_todo_app/models/task.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  final items = List<BaseTile>.generate(
//    6,
//    (i) => i % 6 == 0
//        ? HeadingTile(title: "Heading $i")
//        : TaskTile(
//            task: Task(
//              dateTime: DateFormat.jm().format(DateTime.now()),
//              title: "Title $i",
//            ),
//          ),
//  );
  var tasks = List<Task>();
  int selectedTabIndex = 0;
  bool showReminder = true;
  TextEditingController _controller;
  int categoryIndex = 0;
  var category = {
    0: Colors.yellow,
    1: Colors.green,
    2: Colors.red,
    3: Colors.blue,
    4: Colors.orange,
  };

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            _buildTopSection(),
            _buildMainSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(kButtonColor),
        child: Container(
          width: 56,
          height: 56,
          child: Image.asset("assets/images/fab-add.png"),
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                PurpleLight,
                PurpleDark,
              ],
            ),
          ),
        ),
        onPressed: () {
          _showBottomSheet();
        },
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
              InkWell(
                onTap: () {
                  setState(() {
                    selectedTabIndex = 0;
                  });
                },
                child: Image.asset(
                  "assets/images/home.png",
                  scale: 0.8,
                  color: selectedTabIndex == 0 ? Colors.blue : Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedTabIndex = 1;
                  });
                },
                child: Image.asset(
                  "assets/images/task.png",
                  scale: 0.8,
                  color: selectedTabIndex == 1 ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTopSection() {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            left: -100,
            top: -180,
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
            top: -10,
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
                top: 20,
                left: 20,
                right: 20,
                bottom: 20,
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
                  if (showReminder)
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                              left: 20,
                              right: 30,
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
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  showReminder = !showReminder;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 5,
                                  right: 5,
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildMainSection() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(kBackgroundColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: selectedTabIndex == 0 ? _buildTaskList() : _buildCategoryList(),
      ),
    );
  }

  _buildCategoryList() {
    return Container(
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(6, (index) {
          return CategoryTile(
            title: "Title $index",
            color: category[index],
            tasksCount: 0,
            iconPath: "assets/images/icon-user.png",
          ).buildCategory(context);
        }),
      ),
    );
  }

  _buildTaskList() {
    return tasks.length == 0
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Hero(
                    tag: 'Clipboard',
                    child: Image.asset("assets/images/Clipboard-empty.png"),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'No tasks',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'You have no tasks to do.',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.only(top: 10.0),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final _task = tasks[index];
              return TaskTile(
                task: _task,
                checkedCallback: () {
                  setState(() {
                    _task.toggleDone = !_task.toggleDone;
                  });
                },
                notifiedCallback: () {
                  setState(() {
                    _task.reminder = !_task.reminder;
                  });
                },
                deleteCallback: () {
                  setState(() {
                    tasks.removeAt(index);
                  });
                },
              ).buildTile(context);
            },
          );
  }

  _showBottomSheet() {
    String _title;
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height / 25,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(175, 30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 56,
                          height: 56,
                          child: Image.asset("assets/images/fab-delete.png"),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                PurpleLight,
                                PurpleDark,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Add new task',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: TextFormField(
                                  autofocus: true,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter a task",
                                  ),
                                  onChanged: (value) {
                                    _title = value;
                                  },
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 60,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      width: 1.0,
                                      color: Colors.grey,
                                    ),
                                    bottom: BorderSide(
                                      width: 1.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    CategoryTileEx(
                                      color: category[0],
                                      title: "Personal",
                                      onPress: () {
                                        setState(() {
                                          categoryIndex = 0;
                                        });
                                      },
                                      isSelected: categoryIndex == 0,
                                    ).buildCategory(context),
                                    CategoryTileEx(
                                      color: category[1],
                                      title: "Work",
                                      onPress: () {
                                        setState(() {
                                          categoryIndex = 1;
                                        });
                                      },
                                      isSelected: categoryIndex == 1,
                                    ).buildCategory(context),
                                    CategoryTileEx(
                                      color: category[2],
                                      title: "Meeting",
                                      onPress: () {
                                        setState(() {
                                          categoryIndex = 2;
                                        });
                                      },
                                      isSelected: categoryIndex == 2,
                                    ).buildCategory(context),
                                    CategoryTileEx(
                                      color: category[3],
                                      title: "Study",
                                      onPress: () {
                                        setState(() {
                                          categoryIndex = 3;
                                        });
                                      },
                                      isSelected: categoryIndex == 3,
                                    ).buildCategory(context),
                                    CategoryTileEx(
                                      color: category[4],
                                      title: "Shopping",
                                      onPress: () {
                                        setState(() {
                                          categoryIndex = 4;
                                        });
                                      },
                                      isSelected: categoryIndex == 4,
                                    ).buildCategory(context),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Text(
                                  'Choose date',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Today, 19: - 21:00',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.keyboard_arrow_down),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              RaisedButton(
                                onPressed: () {
                                  if (_title != null) {
                                    var task = Task(
                                        title: _title,
                                        dateTime: DateTime.now(),
                                        categoryColor: categoryIndex);

                                    setState(() {
                                      tasks.add(task);
                                    });
                                  }
                                  Navigator.pop(context);
                                },
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(0.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(kTopSectionColor1),
                                        Color(kTopSectionColor2),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(0.0, 0.0),
                                      ),
                                    ],
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Center(
                                    child: const Text(
                                      'Add task',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
