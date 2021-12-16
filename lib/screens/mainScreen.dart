import 'package:flutter/material.dart';
import 'package:hive_sanple/functions/db_functions.dart';
import 'package:hive_sanple/screens/addStudent.dart';
import 'package:hive_sanple/screens/studentListScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AddStudentScreen(),
            Expanded(child: StudentListScreen())
          ],
        ),
      ),
    );
  }
}
