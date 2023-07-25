import 'dart:io';
import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'group.dart';
import 'block.dart';

part 'student.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  int id;

  @HiveField(1)
  Uint8List? imageFile;

  @HiveField(2)
  String name;

  @HiveField(3)
  String sex;

  @HiveField(4)
  String homeTown;

  @HiveField(5)
  Group group;

  @HiveField(6)
  Block block;

  Student({
    required this.id,
    required this.imageFile,
    required this.name,
    required this.sex,
    required this.homeTown,
    required this.group,
    required this.block,
  });

  void setImageFile (File file) {
    imageFile = file.readAsBytesSync();
  }
}

List<Student> dataStudent = [
  Student(
    id: 0,
    imageFile: null,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[0],
    block: dataBlock[0],
  ),
  Student(
    id: 1,
    imageFile: null,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[0],
    block: dataBlock[0],
  ),
  Student(
    id: 2,
    imageFile: null,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[1],
    block: dataBlock[0],
  ),
  Student(
    id: 3,
    imageFile: null,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[1],
    block: dataBlock[0],
  ),
  Student(
    id: 4,
    imageFile: null,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[2],
    block: dataBlock[0],
  ),
  Student(
    id: 5,
    imageFile: null,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[2],
    block: dataBlock[0],
  ),
  Student(
    id: 6,
    imageFile: null,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[3],
    block: dataBlock[1],
  ),
  Student(
    id: 7,
    imageFile: null,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[3],
    block: dataBlock[1],
  ),
  Student(
    id: 8,
    imageFile: null,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[4],
    block: dataBlock[1],
  ),
  Student(
    id: 9,
    imageFile: null,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[4],
    block: dataBlock[1],
  ),
  Student(
    id: 10,
    imageFile: null,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[5],
    block: dataBlock[1],
  ),
  Student(
    id: 11,
    imageFile: null,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[5],
    block: dataBlock[1],
  ),
  Student(
    id: 12,
    imageFile: null,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[6],
    block: dataBlock[2],
  ),
  Student(
    id: 13,
    imageFile: null,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[6],
    block: dataBlock[2],
  ),
  Student(
    id: 14,
    imageFile: null,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[7],
    block: dataBlock[2],
  ),
  Student(
    id: 15,
    imageFile: null,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[7],
    block: dataBlock[2],
  ),
  Student(
    id: 16,
    imageFile: null,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[8],
    block: dataBlock[2],
  ),
  Student(
    id: 17,
    imageFile: null,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    group: dataGroup[8],
    block: dataBlock[2],
  ),
];
