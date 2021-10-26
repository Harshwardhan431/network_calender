import 'dart:ui';
import 'package:flutter/material.dart';
import 'calender_screen.dart';

class Session extends StatelessWidget {
  static String id = 'Session';

  String title = 'Ganesh Chaturthi';
  String descp =
      'Ganesh Chaturthi is celebrated annually is celebrated to mark the'
      'birth of Lord Ganesha , the God of new beginnings and a fresh start. '
      'The festival falls in the month of Bhadra, yhe date of the festival '
      'varies annulay ,according to the Hindu';
  // Session({required this.title,required this.descp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xFF616161),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Hero(
        tag: 'ani',
        child: Material(
          elevation: 2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 5.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$tempmonthString',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$tempday',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$title',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$descp',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
