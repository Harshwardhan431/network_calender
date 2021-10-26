import 'package:flutter/material.dart';
import 'calender_screen.dart';
class AddEvents extends StatefulWidget {
  const AddEvents({Key? key}) : super(key: key);

  @override
  _AddEventsState createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text('Title',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),),
        ],
      ),
    );
  }
}
