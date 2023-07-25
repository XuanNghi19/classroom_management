import 'dart:io';
import 'dart:typed_data';
import 'student.dart';
import 'block.dart';
import 'group.dart';

Uint8List defaultImage = File('images/images.png').readAsBytesSync();

class DisplayBlock {
  String name;
  List<DisplayType> typeList;
  DisplayBlock({required this.name, required this.typeList});
}

class DisplayType {
  String name;
  Block block;
  List<Student> studentList;
  DisplayType({required this.name, required this.block ,required this.studentList});
}

List<DisplayBlock> displayBlock = List.generate(
  dataBlock.length,
  (index) => DisplayBlock(
    name: dataBlock[index].name,
    typeList: <DisplayType>[],
  ),
);

List<DisplayType> displayType = List.generate(
  dataGroup.length,
  (index) => DisplayType(name: dataGroup[index].name, block: dataGroup[index].block, studentList: <Student>[]),
);