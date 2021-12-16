import 'package:flutter/material.dart';
import 'package:hive_sanple/data_model/student.dart';
import 'package:hive_sanple/functions/db_functions.dart';

class EditStudentScreen extends StatelessWidget {
  final StudentModel stud;

  EditStudentScreen(this.stud);

  final _ageController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _ageController.text = stud.age;
    _nameController.text = stud.name;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(helperText: 'name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(helperText: 'age'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(onPressed: editStudentClicked, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editStudentClicked() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    if (name.isEmpty || age.isEmpty) {
      return;
    }

    var _student = StudentModel(name, age, stud.id);
    editStudentInDb(_student);
  }
}
