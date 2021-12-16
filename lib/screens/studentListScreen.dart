import 'package:flutter/material.dart';
import 'package:hive_sanple/data_model/student.dart';
import 'package:hive_sanple/functions/db_functions.dart';
import 'package:hive_sanple/screens/editStudentScreen.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (ctx, List<StudentModel> studList, child) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(studList[index].name),
                subtitle: Text(studList[index].age),
                trailing: IconButton(
                  onPressed: () {
                    deleteStudent(studList[index].id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return EditStudentScreen(studList[index]);
                    }));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.cyanAccent,
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, int) {
              return const Divider();
            },
            itemCount: studList.length);
      },
    );
  }
}
