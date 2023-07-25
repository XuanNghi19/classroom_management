import 'package:hive_flutter/hive_flutter.dart';
import 'package:scm/group.dart';

import 'student.dart';
import 'display_data.dart';
import 'block.dart';

void setStudent() {
  Map<String, List<Student>> studentMap = {};
  for (Student student in dataStudent) {
    studentMap.putIfAbsent(student.name, () => []);
    studentMap[student.name]!.add(student);
  }

  for (DisplayGroup group in displayGroup) {
    group.studentList.clear();
    group.studentList.addAll(studentMap[group.name]!);
  }
}

void setGroup() {
  Map<String, List<DisplayGroup>> groupList = {};
  for (DisplayGroup type in displayGroup) {
    groupList.putIfAbsent(type.block.name, () => []);
    groupList[type.block.name]!.add(type);
  }

  for (DisplayBlock block in displayBlock) {
    block.groupList.clear();
    block.groupList.addAll(groupList[block.name]!);
  }
}

void setBlock() {
  displayBlock = List.generate(
    dataBlock.length,
    (index) => DisplayBlock(
      name: dataBlock[index].name,
      groupList: <DisplayGroup>[],
    ),
  );
}

Future<void> setLocalBlockData () async {
  final localBlockData = await Hive.openBox<Block>('localBlockData');
  localBlockData.addAll(dataBlock);
  localBlockData.close();
}

Future<void> setlocalGroupData () async {
  final localGroupData = await Hive.openBox<Group>('localGroupData');
  localGroupData.addAll(dataGroup);
  localGroupData.close();
}

Future<void> setlocalStudentData () async {
  final localStudentData = await Hive.openBox<Student>('localStudentData');
  localStudentData.addAll(dataStudent);
  localStudentData.close();
}

void removeStudentFromListType(List<Student> studentList, int id) {
  removeStudentFromDataStudent(id);

  int tmpIndex = studentList.indexWhere((element) => element.id == id);
  studentList.removeAt(tmpIndex);
}

void removeStudentFromDataStudent(int id) {
  int tmpIndex = dataStudent.indexWhere((element) => element.id == id);
  dataStudent.removeAt(tmpIndex);
}
