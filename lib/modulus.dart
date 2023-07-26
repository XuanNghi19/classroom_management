import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scm/group.dart';
import 'student.dart';
import 'display_data.dart';
import 'block.dart';
import 'package:image_picker/image_picker.dart';

final localBlockData = Hive.box<Block>('localBlockData');
final localGroupData = Hive.box<Group>('localGroupData');
final localStudentData = Hive.box<Student>('localStudentData1');

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

void setLocalBlockData () async {
  localBlockData.clear();
  localBlockData.addAll(dataBlock);
}

void setlocalGroupData () async {
  localGroupData.clear();
  localGroupData.addAll(dataGroup);;
}

void setlocalStudentData () async {
  // for(int i = 0; i < dataStudent.length; i++) {
  //   debugPrint('${dataStudent[i].name} ${dataStudent[i].group}');
  // }
  // debugPrint('___________');
  localStudentData.clear();
  localStudentData.addAll(dataStudent);
  // for(int i = 0; i < localStudentData.length; i++) {
  //   debugPrint('${localStudentData.getAt(i)!.name} ${localStudentData.getAt(i)!.group}');
  // }
  // debugPrint('**********');
}

void removelocalStudentData (int index) async {
  // for(int i = 0; i < localStudentData.length; i++) {
  //   debugPrint('${localStudentData.getAt(i)!.name} ${localStudentData.getAt(i)!.group}');
  // }
  // debugPrint('+++++++++');
  localStudentData.delete(index);
}

void removeStudentFromListGroup(List<Student> studentList, int id) {
  removeStudentFromDataStudent(id);


  int tmpIndex = studentList.indexWhere((element) => element.id == id);
  studentList.removeAt(tmpIndex);
}

void removeStudentFromDataStudent(int id) {
  int tmpIndex = dataStudent.indexWhere((element) => element.id == id);
  removelocalStudentData(tmpIndex);
  dataStudent.removeAt(tmpIndex);
}

Student searchStudentWithId(int id) {
  int tmpIndex = dataStudent.indexWhere((element) => element.id == id);
  return dataStudent[tmpIndex];
}