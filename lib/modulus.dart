import 'student.dart';
import 'display_data.dart';
import 'block.dart';

void setStudent() {
  Map<String, List<Student>> studentMap = {};
  for (Student student in dataStudent) {
    studentMap.putIfAbsent(student.group.name, () => []);
    studentMap[student.group.name]!.add(student);
  }

  for (DisplayType type in displayType) {
    type.studentList.clear();
    type.studentList.addAll(studentMap[type.name]!);
  }
}

void setType() {
  Map<String, List<DisplayType>> typeMap = {};
  for (DisplayType type in displayType) {
    typeMap.putIfAbsent(type.block.name, () => []);
    typeMap[type.block.name]!.add(type);
  }

  for (DisplayBlock block in displayBlock) {
    block.typeList.clear();
    block.typeList.addAll(typeMap[block.name]!);
  }
}

void setBlock() {
  displayBlock = List.generate(
    dataBlock.length,
    (index) => DisplayBlock(
      name: dataBlock[index].name,
      typeList: <DisplayType>[],
    ),
  );
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
