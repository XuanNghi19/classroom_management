import 'student.dart';
import 'block.dart';
import 'group.dart';

class DisplayBlock {
  String name;
  List<DisplayGroup> groupList;
  DisplayBlock({required this.name, required this.groupList});
}

class DisplayGroup {
  String name;
  Block block;
  List<Student> studentList;
  DisplayGroup({required this.name, required this.block ,required this.studentList});
}

List<DisplayBlock> displayBlock = List.generate(
  dataBlock.length,
  (index) => DisplayBlock(
    name: dataBlock[index].name,
    groupList: <DisplayGroup>[],
  ),
);

List<DisplayGroup> displayGroup = List.generate(
  dataGroup.length,
  (index) => DisplayGroup(name: dataGroup[index].name, block: dataGroup[index].block, studentList: <Student>[]),
);