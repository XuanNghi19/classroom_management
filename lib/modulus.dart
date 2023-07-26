import 'package:hive_flutter/hive_flutter.dart';
import 'package:scm/group.dart';

import 'student.dart';
import 'display_data.dart';
import 'block.dart';

void setStudent() {
  Map<String, List<Student>> studentMap = {};
  for (Student student in dataStudent) {
    studentMap.putIfAbsent(student.group, () => []);
    studentMap[student.group]!.add(student);
  }

  for (DisplayGroup group in displayGroup) {
    group.studentList.clear();
    studentMap[group.name] != null ? group.studentList.addAll(studentMap[group.name]!) : null;
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
  localBlockData.clear();
  localBlockData.addAll(dataBlock);
  localBlockData.close();
}

Future<void> setlocalGroupData () async {
  final localGroupData = await Hive.openBox<Group>('localGroupData');
  localGroupData.clear();
  localGroupData.addAll(dataGroup);
  localGroupData.close();
}

Future<void> setlocalStudentData () async {
  final localStudentData = await Hive.openBox<Student>('localStudentData1');
  localStudentData.clear();
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
  setlocalStudentData();
}

Student searchStudentWithId(int id) {
  int tmpIndex = dataStudent.indexWhere((element) => element.id == id);
  return dataStudent[tmpIndex];
}