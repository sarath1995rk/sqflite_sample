import 'package:flutter/cupertino.dart';
import 'package:hive_sanple/data_model/student.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
late Database database;

Future<void> initializeDatabase() async {
  database = await openDatabase("students_db", version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT , age TEXT )');
  });
}

Future<void> addStudent(StudentModel model) async {
  await database.rawInsert(
      'INSERT INTO student(name, age) VALUES(?, ?)', [model.name, model.age]);
  getAllStudents();
}

Future<void> getAllStudents() async {
  final _values = await database.rawQuery('SELECT * FROM student');
  print(_values);
  studentListNotifier.value.clear();
  _values.forEach((element) {
    final student = StudentModel.fromMap(element);
    studentListNotifier.value.add(student);
  });

  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int? id) async {
  await database.rawDelete('DELETE FROM student WHERE id = ?', [id]);
  getAllStudents();
}

Future<void> editStudentInDb(StudentModel model) async {
  await database.rawUpdate('UPDATE student SET name = ?, age = ? WHERE id = ?',
      [model.name, model.age, model.id]);

  getAllStudents();
}
