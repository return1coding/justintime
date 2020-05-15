import 'package:flutter/material.dart';
import 'package:justintime/database.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'listitemwidget.dart';
import 'addnewitempage.dart';

List<Text> daysOfTheWeek = [
  Text("MONDAY"),
  Text("TUESDAY"),
  Text("WEDNESDAY"),
  Text("THURSDAY"),
  Text("FRIDAY")
];

int todayDate() {
  DateTime now = DateTime.now();
  if (now.weekday == 6 || now.weekday == 7) {
    return 1;
  } else {
    return now.weekday - 1;
  }
}

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: todayDate(),
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Color(0xFF35C900),
            unselectedLabelStyle:
                TextStyle(fontSize: 10, fontFamily: "Code8x8"),
            unselectedLabelColor: Color(0xFF35C900).withOpacity(0.2),
            labelPadding: EdgeInsets.all(10),
            indicatorColor: Colors.green,
            labelStyle: TextStyle(fontFamily: "Code8x8", fontSize: 15),
            isScrollable: true,
            tabs: daysOfTheWeek,
          ),
          backgroundColor: Color(0xFF002E02),
          elevation: 0,
          title: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "JUST IN timE",
                  style: TextStyle(
                    fontFamily: 'Code8x8',
                    color: Color(0xFF35C900),
                  ),
                ),
                FadeAnimatedTextKit(
                  duration: Duration(milliseconds: 500),
                  isRepeatingAnimation: true,
                  text: ["__"],
                  textStyle: TextStyle(
                    color: Color(0xFF35C900),
                  ),
                  totalRepeatCount: 0,
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color(0xFF002E02),
        body: Column(
          children: <Widget>[
            Container(
              child: Flexible(
                flex: 10,
                child: TabBarView(
                  physics: ScrollPhysics(parent: ClampingScrollPhysics()),
                  children: <Widget>[
                    _buildMondayList(context),
                    _buildTuesdayList(context),
                    _buildWednesdayList(context),
                    _buildThursdayList(context),
                    _buildFridayList(context),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Color(0xFF484848)),
                margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => itemInsertPage()));
                  },
                  child: Center(
                    child: Container(
                      child: Text(
                        "ADD",
                        style: TextStyle(
                          fontFamily: 'Code8x8',
                          color: Color(0xFF00D81D),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  StreamBuilder<List<ListItem>> _buildMondayList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
        stream: database.watchAllListItems(),
        builder: (context, AsyncSnapshot<List<ListItem>> snapshot) {
          final listitems =
              snapshot.data.where((c) => c.itemDay == "MONDAY").toList() ??
                  List();
          return ListView.builder(
              itemCount: listitems.length,
              itemBuilder: (_, index) {
                final listitem = listitems[index];
                return listItemWidget(listitem, database, context);
              });
        });
  }

  StreamBuilder<List<ListItem>> _buildTuesdayList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
        stream: database.watchAllListItems(),
        builder: (context, AsyncSnapshot<List<ListItem>> snapshot) {
          final listitems =
              snapshot.data.where((c) => c.itemDay == "TUESDAY").toList() ??
                  List();
          return ListView.builder(
              itemCount: listitems.length,
              itemBuilder: (_, index) {
                final listitem = listitems[index];
                return listItemWidget(listitem, database, context);
              });
        });
  }

  StreamBuilder<List<ListItem>> _buildWednesdayList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
        stream: database.watchAllListItems(),
        builder: (context, AsyncSnapshot<List<ListItem>> snapshot) {
          final listitems =
              snapshot.data.where((c) => c.itemDay == "WEDNESDAY").toList() ??
                  List();
          return ListView.builder(
              itemCount: listitems.length,
              itemBuilder: (_, index) {
                final listitem = listitems[index];
                return listItemWidget(listitem, database, context);
              });
        });
  }

  StreamBuilder<List<ListItem>> _buildThursdayList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
        stream: database.watchAllListItems(),
        builder: (context, AsyncSnapshot<List<ListItem>> snapshot) {
          final listitems =
              snapshot.data.where((c) => c.itemDay == "THURSDAY").toList() ??
                  List();
          return ListView.builder(
              itemCount: listitems.length,
              itemBuilder: (_, index) {
                final listitem = listitems[index];
                return listItemWidget(listitem, database, context);
              });
        });
  }

  StreamBuilder<List<ListItem>> _buildFridayList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
        stream: database.watchAllListItems(),
        builder: (context, AsyncSnapshot<List<ListItem>> snapshot) {
          final listitems =
              snapshot.data.where((c) => c.itemDay == "FRIDAY").toList() ??
                  List();
          return ListView.builder(
              itemCount: listitems.length,
              itemBuilder: (_, index) {
                final listitem = listitems[index];
                return listItemWidget(listitem, database, context);
              });
        });
  }
}

//TODO Sort widget by date, use SQL commands
//TODO allow user to enter time in 24h format only, easy to sort in ascending order
