import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'events.dart';
import 'sessions.dart';
import 'add_event.dart';

List<int> monthInt = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

List<String> monthString = [
  'January',
  'Feburay',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

var mapMonth = {
  1: 'January',
  2: 'Feburay',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December',
};

DateTime now = DateTime.now();
var date = now.day;
var tempmonthInt;
var tempmonthString;
var tempday;

class Calender extends StatefulWidget {
  static String id = 'Calender';
  const Calender({Key? key}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  bool click = false;
  late Map<DateTime, List<Event>> selectedEvents;
  late Map<DateTime, List<Event>> selectedDisp;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();
  TextEditingController _evevtDescip=TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    selectedDisp={};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  List<Event> _getEventsfromDisp(DateTime date){
    return selectedDisp[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    _evevtDescip.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Calender',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Card(
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(10),
        child: Expanded(
          child: Column(
            children: [
              TableCalendar(
                availableCalendarFormats: {
                  CalendarFormat.month: 'Month',
                  CalendarFormat.week: 'Week',
                },
                focusedDay: selectedDay,
                firstDay: DateTime(1999),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                onDayLongPressed: (DateTime selectedDay, DateTime focusDay) {
                  if (selectedDay.day == 24) {
                    Navigator.of(context)
                        .push(HeroDialogRoute(builder: (context) {
                      return Session();
                    }));
                    //Navigator.push(context, MaterialPageRoute(builder: (context){
                    //    return Session();
                    // }));
                  }
                },
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                    tempmonthInt = selectedDay.month;
                    tempday = selectedDay.day;
                    tempmonthString = mapMonth[tempmonthInt];
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                eventLoader: _getEventsfromDay,
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF82B1FF),
                  ),
                  selectedTextStyle: TextStyle(color: Colors.black),
                  todayDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFBA68C8),
                  ),
                  todayTextStyle: TextStyle(
                    color: Color(0xFF004D40),
                  ),
                  defaultDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  defaultTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                  weekendDecoration: BoxDecoration(
                    color: Color(0xFFBDBDBD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  weekendTextStyle: TextStyle(
                    color: Colors.red,
                  ),
                ),
                headerStyle: HeaderStyle(
                  headerMargin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFBDBDBD),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFF4511E),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    color: Color(0xFF424242),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ..._getEventsfromDay(selectedDay).map(
                (Event event) => ListTile(
                  title: Text(
                    event.title,
                  ),
                ),
              ),
              ..._getEventsfromDisp(selectedDay).map(
                  (Event event) => ListTile(
                    subtitle: Text(
                      event.descrip,
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(
                  color: Color(0xFFECEFF1),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFBDBDBD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '$tempmonthString  $tempday',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Ganesh Chaturthi',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Ganesh Chaturthi is celebrated annually is celebrated to mark the'
                              'birth of Lord Ganesha , the God of new beginnings and a fresh start. '
                              'The festival falls in the month of Bhadra, yhe date of the festival '
                              'varies annulay ,according to the Hindu',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFBDBDBD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '$tempmonthString  $tempday',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Ganesh Chaturthi',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Ganesh Chaturthi is celebrated annually is celebrated to mark the'
                              'birth of Lord Ganesha , the God of new beginnings and a fresh start. '
                              'The festival falls in the month of Bhadra, yhe date of the festival '
                              'varies annulay ,according to the Hindu',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  scrollable: true,
                  backgroundColor: Color(0xFFD1C4E9),
                  title: Text(
                    "Add Event",
                    style: TextStyle(
                      color: Color(0xFF673AB7),
                    ),
                  ),
                  content: Expanded(
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 10,),
                          Text('Title',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),),
                          TextField(
                            controller: _eventController,
                          ),
                          SizedBox(height: 30,),
                          Text('Description',
                          style: TextStyle(
                            fontSize: 20,color: Colors.blue,
                          ),),
                          SizedBox(height: 20,),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  borderSide: new BorderSide()),
                              hintText: "Enter Description",
                              hintStyle: TextStyle(
                                  color: Color(0xFF1A237E),
                              )
                            ),
                            controller: _evevtDescip,
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text("Cancel",
                      style: TextStyle(
                        color: Colors.red,
                      ),),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: Text("Ok",
                      style: TextStyle(
                        color: Colors.green,
                      ),),
                      onPressed: () {
                        if (_eventController.text.isEmpty) {
                        } else {
                          if (selectedEvents[selectedDay] != null) {
                            selectedEvents[selectedDay]?.add(
                              Event(title: _eventController.text),
                            );
                            selectedDisp[selectedDay]?.add(
                              Event(descrip: _evevtDescip.text),
                            );
                          } else {
                            selectedEvents[selectedDay] = [
                              Event(title: _eventController.text),
                            ];
                            selectedDisp[selectedDay]=[
                              Event(descrip: _evevtDescip.text),
                            ];
                          }
                        }
                        Navigator.pop(context);
                        _eventController.clear();
                        _evevtDescip.clear();
                        setState(() {});
                        return;
                      },
                    ),
                  ],
                ),
          ),
          label: Text("Add Event"),
          icon: Icon(Icons.add),
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
  HeroDialogRoute({
    required WidgetBuilder builder,
    //required RouteSettings settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.white;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}