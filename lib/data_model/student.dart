class StudentModel {
  int? id;

  final String name;

  final String age;

  StudentModel(this.name, this.age, [this.id]);

  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as String;
    return StudentModel(name, age, id);
  }

  @override
  String toString() {
    return 'StudentModel{name: $name, age: $age}';
  }
}
