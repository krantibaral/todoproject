import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/ToDo.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(homePage());
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePage createState() => _homePage();
}

class _homePage extends State<homePage> {
  String filterType = "today";
  DateTime today = new DateTime.now();
  String taskPop = 'close';
  var monthNames = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEPT",
    "OCT",
    "NOV",
    "DEC"
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppBar(
            backgroundColor: Color(0xfff96060),
            elevation: 0,
            title: Text(
              'Work List',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Container(
            height: 70,
            color: Color(0xfff96060),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        changeFilter("today");
                      },
                      child: Text(
                        'Today',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 4,
                      width: 120,
                      color: (filterType == "today")
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        changeFilter("monthly");
                      },
                      child: Text(
                        'Monthly',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 4,
                      width: 120,
                      color: (filterType == "monthly")
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          (filterType == "monthly")
              ? TableCalendar(
                  //startingDayOfWeek: StartingDayOfWeek.tuesday,
                  firstDay: DateTime.utc(2021, 11, 16),
                  lastDay: DateTime.utc(2022, 11, 16),
                  focusedDay: DateTime.now(),
                )
              : Container(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today ${monthNames[today.month - 1]}, ${today.day}/${today.year}",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  taskWidget(
                      Color(0xfff96060), "Creating To-do app", "9:00 AM"),
                  taskWidget(Colors.blue, "Meeting with supervisior at college",
                      "7:00 AM"),
                  taskWidget(Colors.green, "Start working on", "10:00 AM"),
                  taskWidget(Colors.black12, "Take rest", "1:00 AM"),
                ],
              ),
            ),
          ),
          
          Center(
            //child: Positioned(
             // height: 25,
             // left: 0,
             // right: 0,
              child: InkWell(
                onTap: openTaskPop,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xfff96060), Colors.red],
                      ),
                      shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          //),
        ]),
        Container(
            child: (taskPop == "open") ?    Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.3),
          child: Center(
              child: InkWell(
            onTap: closeTaskPop,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    InkWell(
                        onTap:openNewTask,
                        child: Container(
                            child: Text(
                          'Add task',
                          style: TextStyle(fontSize: 18),
                        ))),
                    Container(
                      height: 1,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    
                    SizedBox(
                      height: 1,
                    )
                  ],
                )),
          )),
        ): Container(),
        )
      ]),
    );
  }

  openTaskPop() {
    taskPop = 'open';
    setState(() {});
  }

  closeTaskPop() {
    taskPop = 'close';
    setState(() {});
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  Slidable taskWidget(Color color, String title, String time) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.4,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 1)
        ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 24,
              width: 23,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 4)),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    time,
                    style: TextStyle(color: Colors.black),
                  )
                ]),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 50,
              width: 5,
              color: color,
            )
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: "Edit",
          color: Colors.white,
          icon: Icons.edit,
          onTap: () {},
        ),
        IconSlideAction(
          caption: "Delete",
          color: Colors.white,
          icon: Icons.delete,
          onTap: () {},
        ),
      ],
    );
  }
  openNewTask()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ToDo()));
  }
}
